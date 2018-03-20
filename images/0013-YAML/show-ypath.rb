#!/usr/bin/env ruby

## Usage: ruby show-ypath.rb ypath datafile.yaml

require 'yaml'
require 'pp'

## YPath �ѥ�������������
ypath = ARGV.shift
unless ypath
   $stderr.puts "Usage: show-ypath ypath [file.yaml ...]"
   exit(0)
end

## YAML �ե�������ɤ߹��ߡ��ĥ꡼���Ѵ�����
str = ARGF.read()
tree = {{*YAML.parse(str)*}}

## �ĥ꡼��õ������ypath �˥ޥå������Ρ��ɤΥѥ��򤹤٤�ɽ������
puts "#--- search('#{ypath}') ---"
paths = {{*tree.search(ypath)*}}    # paths �ϥѥ�������
paths.each do |path|
  pp path
end

## �ĥ꡼��õ������ypath �˥ޥå������Ρ��ɤ򤹤٤�ɽ������
puts "#--- select('#{ypath}') ---"
nodes = {{*tree.select(ypath)*}}    # nodes �ϥΡ��ɤ�����
nodes.each do |node|
  obj = {{*node.transform*}}    # �Ρ��ɤ򥪥֥������Ȥ��Ѵ�����
  pp obj
end
## �ޤ���
# objs = {{*tree.select!(ypath)*}}
# objs.each do |obj|
#   pp obj
# end
