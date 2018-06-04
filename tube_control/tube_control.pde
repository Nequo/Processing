private class Seat{
    int x;
    boolean locked;
    int size;
    public Seat(int x, int size){
        this.x = x;
        this.size = size;
        this.locked = false;
    }
    public boolean isLocked(){
        return this.locked;
    }
    public int getX(){
        return this.x;
    }
    public int getSize(){
        return this.size;
    }
    public void changeStatus(){
        this.locked = !this.locked;
    }
}

Seat[] seats = new Seat[30];

void draw_tube(){
    rect(50, 100, 900, 300);
}

void create_seats(int index){
    int start_x = 100;
    for(int sets = 0; sets < 3; sets ++){
        for(int seatNo = 0; seatNo < 5; seatNo ++){
           seats[index] = new Seat(start_x, 40);
           index++;
           start_x += 40;
        }
        start_x += 100;
    }
}

void draw_seat(int seat_number){
    if(seats[seat_number].isLocked()){
        fill(#bf6a71);
    }
    else fill(#a3be8c);
    int x = seats[seat_number].getX();
    int size = seats[seat_number].getSize();
    int y;
    if(seat_number < 15){
      y = 100;
    }
    else y = 360;
      
    rect(x, y, size, size);
}

void setup(){
    size(1000, 500);  // Size must be the first statement
    stroke(255);  
    draw_tube();
    create_seats(0);
    create_seats(15);
    
}


void draw(){
    for(int i = 0; i<30; i++){
      draw_seat(i);
    }
}

void mousePressed() {
  print(mouseX);
  print("\n");
  print(mouseY);
  print("\n");
  int row;
  int seatNumber = 0;
  if(mouseY < 140 && mouseY > 100){
     row = 1; 
     print("Row 1 \n");
     for(int seatCount = 0; seatCount < 15; seatCount++){
       if(mouseX > seats[seatCount].getX() && mouseX < seats[seatCount].getX() + 40){
           seats[seatCount].changeStatus();
       }
     }
  }
  if(mouseY < 400 && mouseY > 360){
     row = 2; 
     print("Row 2 \n");
     for(int seatCount = 15; seatCount <30; seatCount++){
       if(mouseX > seats[seatCount].getX() && mouseX < seats[seatCount].getX() + 40){
           seats[seatCount].changeStatus();
       }
     }
  }
  for(int i = 0; i < 30; i++){
    draw_seat(i);
  }
}
