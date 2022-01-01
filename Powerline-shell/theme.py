from powerline_shell.themes.default import DefaultColor


class Color(DefaultColor):
    USERNAME_FG = 8
    USERNAME_BG = 131
    USERNAME_ROOT_BG = 1

    HOSTNAME_FG = 8
    HOSTNAME_BG = 66

    HOME_SPECIAL_DISPLAY = False
    PATH_BG = 235
    PATH_FG = 131
    CWD_FG = 208
    SEPARATOR_FG = 66

    READONLY_BG = 1
    READONLY_FG = 15

    REPO_CLEAN_BG = 2
    REPO_CLEAN_FG = 0
    REPO_DIRTY_BG = 1
    REPO_DIRTY_FG = 15

    JOBS_FG = 14
    JOBS_BG = 8

    CMD_PASSED_BG = 107
    CMD_PASSED_FG = 8
    CMD_FAILED_BG = 186
    CMD_FAILED_FG = 0

    SVN_CHANGES_BG = REPO_DIRTY_BG
    SVN_CHANGES_FG = REPO_DIRTY_FG

    VIRTUAL_ENV_BG = 2
    VIRTUAL_ENV_FG = 0

    AWS_PROFILE_FG = 14
    AWS_PROFILE_BG = 8

    TIME_FG = 8
    TIME_BG = 7

