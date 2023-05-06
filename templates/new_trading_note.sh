# NOTE: echo -e usually, but i3 somehow fucks that up and the \ns work automatically, not sure, multiple layers of parsing apparently adsfasfdsa

TEMPALGIN=$( echo "" | dmenu -p "instrument or name" -l 10 )

python3 /home/qq/codes/notemaster/templates/new_trading_note.py $TEMPALGIN

# case $TEMPALGIN in
# 	"trading")
# 		/home/qq/codes/kiosks/start_trading_kiosk.sh
# 		;;
# 	"note taking")
# 		/home/qq/codes/kiosks/start_trading_note_kiosk.sh
# 		;;
# 	"regular")
# 		echo "nothing to do" 
# 		;;
# esac


