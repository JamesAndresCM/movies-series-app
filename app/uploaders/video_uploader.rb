class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::Video
  include ::CarrierWave::Backgrounder::Delay
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  process :save_video_duration

  def save_video_duration
    video = Time.at(FFMPEG::Movie.new(file.file).duration).utc.strftime("%H:%M:%S")
    res = FFMPEG::Movie.new(file.file).resolution
    model.duration = video
    model.resolution = res
  end

  PROCESSED_DEFAULTS = {
   resolution: :same,
   video_bitrate: :same,
   video_codec:          'libx264', # H.264/MPEG-4 AVC video codec
   constant_rate_factor: '30', # GOP Size
   #frame_rate:           '60', # frame rate
   audio_codec:          'aac', # AAC audio codec
   audio_bitrate:        '64k', # Audio bitrate
   audio_sample_rate:    '44100' # Audio sampling frequency
  }.freeze

  #process encode_video: [:mp4, PROCESSED_DEFAULTS]
  process :encode

  def encode
    if FFMPEG::Movie.new(file.file).video_codec != "h264"
       encode_video(:mp4, PROCESSED_DEFAULTS)
    end
  end
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
     %w(mov mp4 3gp mkv webm m4v avi)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
