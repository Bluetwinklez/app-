# Removes the widget extension and the Apple Watch app from the Xcode
# project for this CI run only, so the app can be signed with the single
# App Store profile when the API key cannot create profiles for them.
require "xcodeproj"

project = Xcodeproj::Project.open(File.join(__dir__, "..", "ios", "Runner.xcodeproj"))
runner = project.targets.find { |t| t.name == "Runner" }
names = %w[NfcWidgets NfcWatch]

runner.dependencies.select { |d| names.include?(d.target&.name) }.each(&:remove_from_project)
runner.build_phases
      .select { |ph| ["Embed Foundation Extensions", "Embed Watch Content"].include?(ph.display_name) }
      .each(&:remove_from_project)
project.targets.select { |t| names.include?(t.name) }.each(&:remove_from_project)
project.save
puts "Removed #{names.join(', ')} for this build"
