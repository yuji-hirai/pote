class Task < ApplicationRecord

validates :title, presence: true
validates :start_time, presence: true
validates :end_time, presence: true
validates :content, presence: true
validate :start_end_check
validate :end_check

def start_end_check
   errors.add(:end_time,"は開始日以降の日付で選択してください")  if start_time.to_i > end_time.to_i
end
def end_check
    errors.add(:end_time,"は、本日以降の日付で選択してください")  if end_time.to_i < Time.now.to_i
end
end
