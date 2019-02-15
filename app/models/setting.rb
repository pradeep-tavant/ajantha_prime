class Setting < ApplicationRecord
  validates :name, :value, presence: true

  singleton_class.class_eval do
    Setting.all.each do |s|
      define_method(:"#{s.name}") do
        s.value
      end
    end
  end
end
