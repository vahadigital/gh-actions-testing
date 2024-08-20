# GitHub Actions workflows

- [GitHub Actions workflows](#github-actions-workflows)
  - [Description](#description)
  - [Usage](#usage)
  - [Contributing](#contributing)
  - [License](#license)
  - [Contact](#contact)
- [Workflows in this repository](#workflows-in-this-repository)
  - [Sync repository to a remote location with rsync](#sync-repository-to-a-remote-location-with-rsync)
  - [Sync repository to a remote locations and exclude folders](#sync-repository-to-a-remote-locations-and-exclude-folders)


## Description

This project is aimed at to make useful GitHub Actions workflows.

## Usage

If you are new to GitHub Actions start from https://docs.github.com/en/actions

Using GitHub Actins locally -> Read more about https://nektosact.com/

## Contributing

Contributions are welcome!

## License

This project is licensed under the MIT License. See the LICENSE.md file for more details.


## Contact

For any questions or inquiries, reach us here in the discussions area.

<br>

# Workflows in this repository
## Sync repository to a remote location with rsync

Very simple Rsync process.


[.github/workflows/test_remote_sync_manual_trigger.yml](/.github/workflows/test_remote_sync_manual_trigger.yml)


## Sync repository to a remote locations and exclude folders

This is similar workflow than the previous but this excludes the folder "public/var/assets/" from the sync process. Use exclude flag when you don't want overwrite something in the target.

[.github/workflows/test_remote_sync_and_exclude_manual_trigger.yml](/.github/workflows/test_remote_sync_and_exclude_manual_trigger.yml)