Groonga::Schema.define do |schema|
  # $B40A40lCW8!:wMQ$N8lWCI=!#%H!<%/%J%$%6!<$O$J$7!#(B
  schema.create_table("Names",
                      :type => :hash,
                      :key_type => "ShortText") do |table|
  end

  # $B8!:wBP>]$N%F!<%V%k(B
  schema.create_table("Entries",
                      :type => :hash,
                      :key_type => "ShortText") do |table|
    table.reference("name", "Names")
    table.text("summary")
    table.text("description")
  end

  # $BA4J88!:wMQ$N8lWCI=!#%H!<%/%J%$%6!<$H$7$F(BN-gram$B$r;HMQ!#(B
  schema.create_table("Terms",
                      :type => :patricia_trie,
                      :key_type => "ShortText",
                      :default_tokenizer => "TokenBigram",
                      :key_normalize => true) do |table|
   # $BA4J88!:wMQ$N:w0z(B
    table.index("Entries.summary", :with_position => true)
    table.index("Entries.description", :with_position => true)
  end

  schema.change_table("Names") do |table|
    # $BA4J88!:wMQ$N:w0z(B
    table.index("Entries.name", :with_position => true)
  end
end
