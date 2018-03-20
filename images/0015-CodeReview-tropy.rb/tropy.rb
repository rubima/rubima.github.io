#
# tropy.rb - Tropy in Ruby, Version 0.2
#
# Copyright (C) 2005,2006 by Hiroshi Yuki.
# http://www.hyuki.com/tropy/
#
# You can redistribute and/or modify it under the same terms as Ruby.
#
require "cgi"
require "nkf"
require "pstore"

CHARSET = "Shift_JIS"
NKF_OPTION = "-m0 -s"

BEGIN { $defout.binmode }

module Tropy

  # id�ƃ��b�Z�[�W�i�^�C�g���Ɩ{�́j���Ǘ�
  class Database < PStore
    INDEX = "index" # id�ꗗ�ۑ��p�̃L�[

    def initialize(filename)
      super(filename)
      transaction do
        unless self[INDEX]
          self[INDEX] = []
        end
      end
    end

    def empty?
      transaction(true) do
        self[INDEX].length == 0
      end
    end

    # ���݂���id���烉���_���Ɉ�I��
    def random_id
      transaction(true) do
        size = self[INDEX].length
        self[INDEX][rand(size)]
      end
    end

    # ���݂̗L���ɂ�����炸�����_����id�������
    def create_id
      sprintf("%08d", rand(10 ** 8))
    end

    # id��ǉ�
    def add_id(id)
      unless self[INDEX].index(id)
        self[INDEX] << id
      end
    end

    # id���폜
    def delete_id(id)
      index = self[INDEX].index(id)
      if index
        self[INDEX].delete_at(index)
      end
    end

    # id�̃y�[�W�Ƀ��b�Z�[�Wm��ۑ�
    def set_msg(id, m)
      id = id.to_s
      m = NKF::nkf(NKF_OPTION, m.to_s)
      transaction do
        if m.length > 0
          self[id] = m
          add_id(id)
        else
          self.delete(id)
          delete_id(id)
        end
      end
    end

    # id�̃y�[�W�̃��b�Z�[�W
    def msg(id)
      transaction(true) do
        self[id.to_s].to_s
      end
    end

    # id�̃y�[�W�̃^�C�g���i��s�ځj
    def title(id)
      if msg(id) =~ /^(.*)$/
        $1
      else
        ""
      end
    end

    # id�̃y�[�W�̖{�́i��s�ڈȍ~�j
    def body(id)
      msg(id).sub!(/^.*$/, "")
    end
  end

  class Tropy
    def initialize(cgi, db)
      @db = db
      begin
        cgi.params.each_key do |k|
          if k =~ /^(\d{8})$/
            @id = $1
            do_read
          elsif k =~ /^e(\d{8})$/
            @id = $1
            do_edit
          elsif k =~ /^w(\d{8})$/
            @id = $1
            do_write(cgi.params["msg"])
          elsif k =~ /^c$/
            @id = @db.create_id
            do_create
          end
        end
        unless @id
          if @db.empty?
            @id = @db.create_id
            do_create
          else
            @id = @db.random_id
            do_read
          end
        end
      rescue
        print error
      end
    end

    # �V�K�y�[�W�쐬�t�H�[����\��
    def do_create
      print header("New Page"), editform, footer
    end

    # @id�Ŏw�肵���y�[�W��\��
    def do_read
      print header(@db.title(@id), :editable), content, footer
    end

    # @id�Ŏw�肵���y�[�W�̕ҏW�t�H�[����\��
    def do_edit
      print header(@db.title(@id)), editform, footer
    end

    # @id�Ŏw�肵���y�[�W��msg����������
    def do_write(msg)
      @db.set_msg(@id, msg)
      print "Location: #{ABSOLUTE_URL}?#{@id}\n\n"
    end

    # �ҏW�t�H�[��
    def editform
      escmsg = CGI.escapeHTML(@db.msg(@id))
      <<-"EOD"
<form action="#{ABSOLUTE_URL}" method="post">
<input type="hidden" name="w#{@id}" value="1">
<textarea cols="#{MAX_COLS}" rows="#{MAX_ROWS}" name="msg">#{escmsg}</textarea><br>
<input type="submit" value="Write">
</form>
      EOD
    end

    # ���g
    def content
      body = CGI.escapeHTML(@db.body(@id))
      body.gsub!(/\n/, "<br />")
      "<p>#{body}</p>"
    end

    # �w�b�_
    def header(title, editable=nil)
      edit = editable == :editable ? %Q(<a href="?e#{@id}">Edit</a>) : ''
      create = %Q(<a href="?c">Create</a>)
      random = %Q(<a href="#{ABSOLUTE_URL}">Random</a>)
      <<-"EOD"
Content-type: text/html; charset=#{CHARSET}

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ja">
<head>
<meta http-equiv="content-type" content="text/html; charset=#{CHARSET}">
<meta http-equiv="content-style-type" content="text/css">
<base href="#{ABSOLUTE_URL}">
<style type="text/css"><!--
body{font-family:Verdana,sans-serif;margin:2% 20% 10% 20%;color:black;background-color:white;}
input{font-family:Verdana,sans-serif;}
#navi{text-align:right;}
p{line-height:150%;}
a{color:gray;background-color:white;text-decoration:none;}
a:hover{text-decoration:underline;color:white;background-color:gray;}
--></style>
<title>#{title} - #{TITLE}</title>
</head>
<body>
<p id="navi">#{edit} #{create} #{random}</p>
<h1>#{title}</h1>
      EOD
    end

    # �t�b�^
    def footer
      "</div></body></html>"
    end

    # �G���[
    def error
      <<-"EOD"
Content-Type: text/html

<html><head><title>Error</title></head><body><h1>Error</h1><pre>
#{$!}
#{$!.class}
#{$@.join("\n")}
</pre>
      EOD
    end
  end
end
