set_color $tide_pwd_color_anchors | read -l color_anchors
set_color $tide_pwd_color_truncated_dirs | read -l color_truncated

set -l unwritable_icon $tide_pwd_icon_unwritable' '
set -l home_icon $tide_pwd_icon_home' '
set -l pwd_icon $tide_pwd_icon

eval "function _tide_pwd
	set -l current_dir (string replace -r '^$HOME' '~' -- \$PWD | string split /)[-1]
	set -g _tide_pwd_len (string length -V \$current_dir)
	printf (set_color normal -b $tide_pwd_bg_color; set_color $tide_pwd_color_dirs)\$current_dir
end"
