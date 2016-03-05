class Entry < ActiveRecord::Base
	belongs_to :case
	belongs_to :doctor
end