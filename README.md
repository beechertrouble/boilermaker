# boilermaker
helper jammer for starting a new repo


## general idea
- clone this repo
- run the bash script
- follow the prompts to create a new repo altogether, along with some basic stuff like wiki pages
- the bash script should also destroy this repo 

## required
1) - if you don't have a github token in your global config :
    - create a github token here : [https://github.com/settings/tokens](https://github.com/settings/tokens)
    - make sure you tick the `repo` checkbox, that's really all you need for permission to create a private repo.
    - copy it and put it in your global config like :
    ```
    git config --global github.token <your token here>
    ``` 