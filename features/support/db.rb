require 'active_record'

class OraDb < ActiveRecord::Base
  establish_connection(
  :adapter  => 'oracle',
  :host     => '192.168.110.239',
  :port     => '1521',
  :database => 'yhdtest1',
  :username => 'purchase',
  :password => 'yhdtest123qa')
end

class MysqlDb < ActiveRecord::Base
  establish_connection(
  :adapter  => 'mysql2',
  :host     => '10.0.0.31',
  :database => 'centralmobile',
  :username => 'yhd_mobile',
  :password => 'yhd_mobile')
end

