FactoryBot.define do
  factory :video do
    sequence(:name) { |n| "Video #{n}" }
    association :series
    video { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/factories/files/video.mp4'))) }
    after(:create) do |v|
      v.update_column(:video, "video.mp4")
    end
  end
end
