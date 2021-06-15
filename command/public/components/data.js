// Import the Backpack class so we can make new Backpack objects.
import Rover from "./Rover.js";

// Create new Rover Object
const RoverPacket = new Rover(
    "Exploring Uranus",
    "Rover01",
    "001",
    "December 5, 2018 15:00:00 PST",
    "./assets/battery.png",
    10,
    100,
    21,
    69,
    102,
    false,
    false,
    false,
    false,
    false,
    false
    );

const roverObjectArray = [RoverPacket];
export default RoverPacket;