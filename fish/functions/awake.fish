function awake -d "蓋を閉じてもスリープしないようにする（戻すのは rest）"
    sudo pmset -a disablesleep 1
    and echo "🔒 スリープ無効化（蓋を閉じてもOK）— 戻すときは rest"
end
