# ES6 Eslint setup

Have  you had that feeling where when you are busy trying to beat the deadlines and you have to do a whole new project setup for the Javascript ES6 projects?
It gets worse when you have to do the setup on every project daily copying and pasting from the intranet and testing if its works and maybe you forgot to run `npm install` urgh! We are Software engineers for code's sake and repetition should not be on our dictionary.

The main goal of the script below is to setup the project in a single click. Make sure that you Do not repeat yourself(DRY)

## project setup
- The script works on all UNIX, LINUX based systems with `bash` installed. WSL included also.

### process 1
`The boring way`
1.clone the project to the working directory. 
2. run `~/your_workingdir/Auto-scripts/js_eslint_setup.sh`

3. `add the directory in your `.gitignore` file and you are good to go.

### process 2
`God-mode`
1. Clone the repository to your home directory
2. Open the `bashrc` file using your favourite editor
3. add an `alias` that paths to the path of the file
    `alias es='/home/was/Auto-scripts/js_eslint_setup.js`
    NB: use an alias name of choice
4. save and exit the file
4. To be able to use the `alias` above in any directory of choice, run:
`source ~/.bashrc` 
- THis makes the aliases created available to any directory in your system.

- run `es` in this case the name of the alias you created in your working directory and let the script do what it does best.


+++++++++++++++++++++++++++++++++++++++++++++++++++++++
    Pointers
- To use `Eslint`:
run `npm run lint name_of_file.js`

- to fix basic eslint issues run:
`eslint --fix name_of_file.js`

- To execte the js script, run:
`npm run dev name_of_file.js`

NB: the above command  does not fix lint issues
# `HAPPY CODDING`

