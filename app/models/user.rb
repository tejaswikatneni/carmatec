class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name  
  has_many :players

  def name
    "#{self.first_name}"+"#{self.last_name}"
  end

  def score
    players.collect{|player| player.score.to_i}.sum
  end
end
