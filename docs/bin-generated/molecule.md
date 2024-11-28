% molecule(1) Version Latest | Test Ansible roles
# NAME

The `molecule` cli aids in the development and testing of Ansible roles.

Official documentation: [molecule command line cli](https://ansible.readthedocs.io/projects/molecule/usage/)

# SYNOPSIS

```bash
Usage: molecule [OPTIONS] COMMAND [ARGS]...

  Molecule aids in the development and testing of Ansible roles.

  To enable autocomplete for a supported shell execute command below after
  replacing SHELL with either bash, zsh, or fish:

      eval "$(_MOLECULE_COMPLETE=SHELL_source molecule)"

Options:
  --debug / --no-debug    Enable or disable debug mode. Default is disabled.
  -v, --verbose           Increase Ansible verbosity level. Default is 0.
  -c, --base-config TEXT  Path to a base config (can be specified multiple
                          times). If provided, Molecule will first load and
                          deep merge the configurations in the specified
                          order, and deep merge each scenario's molecule.yml
                          on top. By default Molecule is looking for
                          '.config/molecule/config.yml' in current VCS
                          repository and if not found it will look in user
                          home. (None).
  -e, --env-file TEXT     The file to read variables from when rendering
                          molecule.yml. (.env.yml)
  --version
  --help                  Show this message and exit.

Commands:
  check        Use the provisioner to perform a Dry-Run (destroy,...
  cleanup      Use the provisioner to cleanup any changes.
  converge     Use the provisioner to configure instances (dependency,...
  create       Use the provisioner to start the instances.
  dependency   Manage the role's dependencies.
  destroy      Use the provisioner to destroy the instances.
  drivers      List drivers.
  idempotence  Use the provisioner to configure the instances.
  init         Initialize a new scenario.
  list         List status of instances.
  login        Log in to one instance.
  matrix       List matrix of steps used to test instances.
  prepare      Use the provisioner to prepare the instances into a...
  reset        Reset molecule temporary folders.
  side-effect  Use the provisioner to perform side-effects to the instances.
  syntax       Use the provisioner to syntax check the role.
  test         Test (dependency, cleanup, destroy, syntax, create,...
  verify       Run automated tests against instances.
```