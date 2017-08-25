class Song < ActiveRecord::Base
  validates :year, numericality: true, length: { in: 2..4 }
  validates :track_number, numericality: true, length: {in: 1..2}
end

# validates :title, length: { in: 1..50}
# validates :artist, length: {in: 1..50}
# validates :album, length: {in: 1..100}
# validates :genre, inclusion: {in: ["Jazz", "Rock", "Classical", "Blues"]}
# validates :length_in_seconds, numericality: true, length: {in: 1..1500}
# validates :image, presence: true
