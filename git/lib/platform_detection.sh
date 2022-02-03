platform_is_wsl2() {
    grep --ignore-case --extended-regexp "\b(Microsoft|msft)\b" /proc/version >/dev/null ||
        grep --ignore-case --extended-regexp "\bWSL2\b" /proc/version >/dev/null
}

platform_is_mingw() {
    grep --ignore-case --extended-regexp "\bMINGW64_NT\b" /proc/version >/dev/null
}
