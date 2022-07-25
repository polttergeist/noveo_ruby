require_relative 'version_manager'

vm = VersionManager.new('2.3.1')
puts vm.release

vm.major!
puts vm.release
vm.minor!
puts vm.release
vm.patch!
puts vm.release

vm.rollback!
puts vm.release
