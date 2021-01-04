class Shop < ApplicationRecord
  validates :name, presence: true, length: {maximum: 30}
  validates :recommended, presence: true
  validates :prefecture_id, presence: true
  validates :open_at, presence: true
  validates :close_at, presence: true
  validates :description, length: {maximum: 300}

  has_one_attached :image
  belongs_to :account
  has_many :favorites
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader

  geocoded_by :city
  after_validation :geocode, if: :city_changed?

  enum prefecture_id: {
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }
  enum holiday_id: {
    日曜日:1,月曜日:2,火曜日:3,水曜日:4,木曜日:5,金曜日:6,土曜日:7,不定休:8
  }

  scope :search, -> (search_params) do
    return if search_params.blank?

    name_like(search_params[:name])
      .prefecture_id_is(search_params[:prefecture_id])
  end
  scope :name_like, -> (name){where('name LIKE ?', "%#{name}%") if name.present?}
  scope :prefecture_id_is, -> (prefecture_id){where(prefecture_id: prefecture_id) if prefecture_id.present?}

  def favorited_by?(account)
    favorites.where(account_id: account.id).exists?
  end

end
