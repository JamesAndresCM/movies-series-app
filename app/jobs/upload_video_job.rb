class UploadVideoJob < ApplicationJob
  include ::CarrierWave::Workers::ProcessAssetMixin
end
