require 'data_mapper'
require 'dm-postgres-adapter'

# This class corresponds to a table in the database
# We can use it to manipulate the data
class Guest

  # adds datamapper functionality to this class
  include DataMapper::Resource

  # these property declarations set the column headers in the Link table
  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :name,  String
  property :attending, String
  property :others, String
  property :guest1_menu, String
  property :partner_name, String
  property :partner_menu, String
  property :child_1_name, String
  property :child_1_menu, String
  property :child_2_name, String
  property :child_2_menu, String
  property :bbq, String
  property :additional, String, :length => 1000
end

class Message

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :message, String, :length => 1000
  property :subject, String

  has n, :answers

end

class Answer

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :answer, String, :length => 1000

  belongs_to :message

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
DataMapper.finalize
DataMapper.auto_upgrade!
