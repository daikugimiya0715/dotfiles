function zunda -d "ずんだもん読み上げ（VOICEVOX）のオン/オフを切り替える"
    if test -f ~/.voicevoice_enabled
        rm ~/.voicevoice_enabled
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
