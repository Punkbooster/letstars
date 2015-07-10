class User < ActiveRecord::Base
  # Include default users modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_voter     

  has_many :comments
  has_one :profile
  has_many :musics

  def can_vote?(contest)
  	contest.musics.each do |music|
  		if self.voted_for?(music)
  			return false
      elsif Date.today>contest.contest_end
        return false
		end
  	end

  	return true
  end
end
