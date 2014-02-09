SimpleCov.start 'rails' do
  add_group "Models",      "app/models"
  add_group "Controllers", "app/controllers"
  add_group "Helpers",     "app/helpers"
  add_group "Services",    "app/services"

  add_group "Long files" do |src_file|
    src_file.lines.count > 100
  end

  add_group "Short files" do |src_file|
    src_file.lines.count < 5
  end

  minimum_coverage 75
end
