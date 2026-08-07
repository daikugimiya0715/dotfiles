function rest -d "通常のスリープ挙動に戻す"
    sudo pmset -a disablesleep 0
    and echo "😴 スリープ有効化（通常動作）"
end
