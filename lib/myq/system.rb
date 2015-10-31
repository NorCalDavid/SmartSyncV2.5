require 'liftmaster_myq'

module MyQ
  class System
    
    def self.authenticate(username, password)
      @system = LiftmasterMyq::System.new(username, password)
    end

    def self.gateways(system)
      system.gateways
    end

    def self.doors(system)
      system.garage_doors
    end

    def self.door_count(system)
      system.garage_doors.count
    end

    def self.open(system, door_id)
      system.garage_doors[door_id].open
    end

    def self.close(system, door_id)
      system.garage_doors[door_id].close
    end

    def self.status(system, door_id)
      system.garage_doors[door_id].status
    end

  end
end
