# $B8!:wBP>]$N%F!<%V%k(B
table_create Entries TABLE_HASH_KEY ShortText
# $BA4J88!:wMQ$N8lWCI=!#%H!<%/%J%$%6!<$H$7$F(BN-gram$B$r;HMQ!#(B
table_create Terms TABLE_PAT_KEY ShortText --default_tokenizer TokenBigram
# $B40A40lCW8!:wMQ$N8lWCI=!#%H!<%/%J%$%6!<$O$J$7!#(B
table_create Names TABLE_HASH_KEY ShortText

# $B8!:wBP>]$N%G!<%?3JG<>l=j(B
column_create Entries name COLUMN_SCALAR Names
column_create Entries summary COLUMN_SCALAR Text
column_create Entries description COLUMN_SCALAR Text

# $BA4J88!:wMQ$N:w0z(B
column_create Terms Entries_summary COLUMN_INDEX|WITH_POSITION Entries summary
column_create Terms Entries_description COLUMN_INDEX|WITH_POSITION Entries description

# $B40A40lCW8!:wMQ$N:w0z(B
column_create Names Entries_name COLUMN_INDEX|WITH_POSITION Entries name
