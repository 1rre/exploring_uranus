// // Set up the Rover class
// class Rover {
//     constructor(
//         //  ROVER
//         id,
//         name,
//         packet,
//         timestamp,
//         image,
//         //  DRIVE
//         posX,
//         posY,
//         travelled_distance,
//         //  ENERGY
//         percentage,
//         remaining_distance,
//         //  COMMAND
//         directionL,
//         directionR,
//         directionU,
//         directionD,
//         rotateClock,
//         rotateAClock
//     ) {
//         //  ROVER
//         this.id = id;
//         this.name = name;
//         this.packet = packet;
//         this.timestamp = timestamp;
//         this.image = image;
//         //  DRIVE
//         this.position = {
//             horizontal : posX,
//             vertical : posY,
//         };
//         this.travelled_distance = travelled_distance;
//         //  ENERGY
//         this.percentage = percentage;
//         this.remaining_distance = remaining_distance;
//         //  COMMAND
//         this.direction = {
//             left : directionL,
//             right : directionR,
//             up : directionU,
//             down : directionD
//         };
//         this.rotate = {
//             clockwise : rotateClock,
//             anticlockwise : rotateAClock
//         };
//     }
    
// /* ================== METHODS ================== */
//     //  ROVER
//     updatePacket(packetStatus) {
//     this.packet = packetStatus;
//     }
//     packetAge() {
//         let now = new Date();
//         let acquired = new Date(this.timestamp);
//         let elapsed = now - acquired; // elapsed time in milliseconds
//         return elapsed;
//     }
//     //  DRIVE
//     updatePosition(xStatus,yStatus) {
//         this.posX = xStatus;
//         this.posY = yStatus;
//     }
//     updateTravDistance(distanceStatus) {
//         this.travelled_distance = distanceStatus;
//     }
//     //  ENERGY
//     updatePercentage(percentStatus) {
//         this.percentage = percentStatus;
//     }
//     updateRemDistance(distanceStatus) {
//         this.remaining_distance = distanceStatus;
//     }
//     //  COMMAND
//     toggleLeft(directionStatus) {
//     this.direction.left = directionStatus;
//     }
//     toggleRight(directionStatus) {
//         this.direction.right = directionStatus;
//     }
//     toggleUp(directionStatus) {
//         this.direction.up = directionStatus;
//     }
//     toggleDown(directionStatus) {
//         this.direction.down = directionStatus;
//     }
//     rotateClockwise(rotationStatus) {
//         this.rotate.clockwise = rotationStatus;
//     }
//     rotateAnticlockwise(rotationStatus) {
//         this.rotate.anticlockwise = rotationStatus;
//     }
// };
    
//     // Export the Command class to be used by other files
//     export default Rover;