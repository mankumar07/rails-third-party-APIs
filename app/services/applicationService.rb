class ApplicationService
  def self.call(*args)
    # byebug
    new(*args).call
  end
end