# Janet-rvars

rvars is a simple module to allow for easy generation of trash variables that can be used to test the input validation of different functions. Tired of defining different data structures and variables to test input? Then rvars has you covered. With a few simple functions you can generate a random variable of different that can be easily passed into a function to see if you catch statements handle the input validation correctly.


## Installation
### Make sure Janet and jpm are installed on your system.
The first step is to make sure that you have access to the Janet lang and jpm. Once these are installed you can begin the process of installing rvars. The installation used the jpm build system to install the module to the janet library dir.
### Clone the repo to a desired destination
Clone the repo in to a directory of your chosing using the command
```
git clone https://github.com/JMinyard1335/Janet-rvars.git
```
### Move into the repo and run jpm install
Move in to the repo you cloned and run the following command
```
jpm install
```
This should move the module into whereever your base janet install location is. 
### import and use in a project
From this point you should be good to import the module into whatever project you are looking to use it in.
```
(import rvars :as rv)

(rv/gen-rand-int 0 10)
```
## Features

## Todo