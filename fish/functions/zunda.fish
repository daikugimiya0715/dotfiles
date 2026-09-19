function zunda -d "ずんだもん読み上げ（VOICEVOX）の切り替え・停止・速度変更"
    set -l sub $argv[1]

    switch "$sub"
        case stop s
            voicevoice --stop
            echo "⏹  読み上げを止めました"
            return 0

        case speed
            if test -z "$argv[2]"
                set -l cur 1.3
                test -f ~/.voicevoice_speed; and set cur (cat ~/.voicevoice_speed)
                echo "現在の読み上げ速度: $cur （例: zunda speed 1.6）"
                return 0
            end
            echo $argv[2] >~/.voicevoice_speed
            echo "⏩ 読み上げ速度を $argv[2] にしました"
            if type -q voicevoice
                voicevoice "この速さなのだ" &
                disown
            end
            return 0
    end

    if test -f ~/.voicevoice_enabled
        rm ~/.voicevoice_enabled
        voicevoice --stop
        echo "🔇 ずんだもん読み上げをオフにしました — 戻すときはもう一度 zunda"
    else
        touch ~/.voicevoice_enabled
        echo "🔊 ずんだもん読み上げをオンにしました"
        if type -q voicevoice
            voicevoice "ずんだもん、オンなのだ" &
            disown
        end
    end
end
