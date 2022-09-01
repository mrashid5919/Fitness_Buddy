# Fitness Buddy
A Daily calorie intake and burn tracker website which helps you select your goals according to your desires.

### Built With

- Nodejs
- EJS
- Bootstrap
- Oracle

<!-- GETTING STARTED -->
## Getting Started

Follow the step by step installation procedure to install and run this on your machine

### Prerequisites

Make sure you have node and oracle installed in your device.

**`NodeJs`**: Install Nodejs from [here](https://nodejs.org/en/download/)

**`Oracle`**:Install Oracle from [here](http://www.oracle.com/index.html) and register for an account of your own



### Installation

#### Getting the repository

1. Clone the repo
   ```sh
   git clone https://github.com/mrashid5919/Fitness_Buddy.git
   ```

2. If you don't have git installed in your device then download zip

3. After installation or download go to the repository and open command line.

4. Install NPM packages

   ```sh
   npm install
   ```



#### Setting up the database

1. Go to sql plus

2. Enter credentials

   ```sh
   username: sys as sysdba
   password: password
   ```

3.  Create a new user C##MAY

   ```sh
   create user C##MAY identified by abcd;
   grant all privileges to C##MAY;
   ```

4. Find file dump.sql in `sql/C##MAY.sql`

6. Head over to your favourite database GUI and connect C##MAY with that

7. Import data from sql file depending upon the GUI. 

8. If no errors are shown, then we are good to go!

## Contributors

- **Mayesha Rashid** - 1905103

- **Sadia Tabassum** - 1905091

Demonstration video - https://youtu.be/MKO7USH14NA
