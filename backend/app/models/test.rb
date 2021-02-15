class Test
  # include ActiveModel::Attributes
  # attribute :name, :string
  # attribute :age, :integer
  # attribute :width, :integer, default: 0


  # extend ActiveModel::Callbacks
  # attr_accessor :created_at, :updated_at
  # # define_model_callbacks :save
  # define_model_callbacks :save, only: %i[before]
  # before_save :record_timestamps

  # def save
  #   run_callbacks :save do
  #     true
  #   end
  # end

  # private

  #   def record_timestamps
  #     current_time = Time.current
  #     self.created_at ||= current_time
  #     self.updated_at ||= current_time
  #   end


  # include ActiveModel::Model
  # include ActiveModel::Validations
  # include ActiveModel::Validations::Callbacks
  # attr_accessor :name, :age
  # before_validation :normalize_name, if: -> { name.present? }
  # validates :name, presence: true, length: { maximum: 100 }
  # validates_numericality_of :age, greater_than: 0

  # private

  #   def normalize_name
  #     self.name = name.downcase.titleize
  #   end
end