# Orbs-badges

## Easily generate and update ReadMe badges 


This orb creates a badge that looks like this:

![badge](https://badges.rhems-japan.com/api-get-badge.svg?user_id=SuXRjLryiXUnKMsqxKYMqFfpS6t2&organization=RHEMS-Japan&repo=orbs-badges&app=orbs-badges&branch=alpha&cised=true&update=20211214-063825)

![badge](https://badges.rhems-japan.com/api-get-badge.svg?user_id=SuXRjLryiXUnKMsqxKYMqFfpS6t2&timedelta=9&organization=RHEMS-Japan&repo=orbs-badges&app=orbs-badges&branch=alpha&cised=true&update=20211214-063825)


This orb has the following functions.

- Immediately reflect the results of CircleCi jobs on the badge.
- You can instantly embed the latest badge you created in the ReadMe.
- If you embed `timedelta = X` in the URL described in the ReadMe, you can embed the time stamp in the badge.
- In addition to CircleCi's job status, you can also put your favorite character string (for example, version number).

## How to Use ?

### 1. Sign in to RHEMS BADGES

[RHEMS BADGES](https://badges.rhems-japan.com/)

Sign in using your github account.

<img src="images/image01.png" width="300px">

### 2. Check `user id` and` api token`

The `user id` and` api token` are displayed.
- `api token`: Required when creating a badge.
- `user id`: Required for badge display.

### 3. Write the URL anywhere in the README

First, it's a good idea to run curl once to generate any badges.

The URL format of the image has the following structure.

https://badges.rhems-japan.com/api-get-badge.svg?user_id=`user id`&`timedelta=9`&organization=`organization name`&repo=`repository name`&app=`app name`&branch=alpha&cised=true&update=20211214-063825)

|param|description|
|:---:|:---|
|`user id`|User ID obtained from "RHEMS badge"|
|`organization name of github`|Organization name of github. orb will automatically use the organization name of the repository in use if you are not doing anything|
|`repository name`|orb will automatically use the repository name in use if you haven't done anything in particular.|
|`app name`|The string on the left side of the badge.|
|`update date`|It is a time stamp automatically given by the application side.|
|`timedelta=X`|(option) If included, the badge will be given the time in the specified time zone.|

### 4. Prepare ssh key.

This orb has a function to rewrite README and `git push` in CircleCi job. Therefore, it is necessary to generate an ssh key with write permission in advance and register it in GitHub and CircleCi respectively.

#### 1. Create an ssh key

Use the `ssh keygen` command to generate a public / private key.

#### 2. Register your public key in the GitHub repository

- Open the `Setting` of your repository.
- Select `Deploy keys` from the menu on the left.
- Select `add deploy key`, copy and paste the contents of the public key (.pub) to Title with any name and Key.
- Check `Allow write access` and select `Add key`.

#### 3. Register your private key with your CircleCi project

- Open the `Project Settings` of your CircleCi project.
- Select `SSH Keys` from the menu on the left.
- Select `Add SSH Keys` under `Additional SSH Keys`.
- Paste all the contents of the private key you generated earlier into the Hostname, `github.com`, and the Private Key.
- Confirm that `Fingerprint` is displayed after registering the private key.


### 5. How to write `.circleci/config.yml`

Please specify the latest version of orb as much as possible.

```yml
  version: 2.1
  orbs:
    badges: rhems-japan/badges@x.y.z
```

Before calling this orb command, call the command to add the `ssh key` mentioned above.
For `fingerprints`, enter the character string confirmed earlier.

```yml
commands:
  setup_ssh_keys:
    steps:
      - add_ssh_keys:
          fingerprints:
          - "a0:b1:c2:d3:e4:f5:a6:b7:c8:d9:ea:fb:0c:1d:2e:55"
          
jobs:
  job_name:
    docker:
      - image: cimg/base:stable
    steps:
      - setup_ssh_keys
      - checkout
      - badges/create_badge
      - badges/update_readme
```

