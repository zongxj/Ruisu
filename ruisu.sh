#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�S�Zruisu.sh �Umo�V��_q0���7/��QE�V���n�(+�{�X�K���"R)Cmh��B�V��hBt�Z����,v�O�;��PA�&�%Rl�<�9�>�9ǧO��n���8�f��'&T�Rf�JԲ�[�U(2Z����bR�
D#ɩ�#����<K�����982�-�!ɹL1C6�Q
�9 
�5	�@B�s*Jyt�_�r��nOZ�/�A�A��FJ�+2jPš���V�V�W��t.�))��	��4�%jqT-��w����n����\ۑ���]�����4������{<G�u��tL'xV~_?j���r��0x���b`�>1K�9I�1I$y��Qa��f�/}����%�ݶ�9��ƽF&���H���(e�.�I��~"q5��s)g��y,�C@pȜCDR���{u�络��XL2�-x��׹�=�m�g�}Qp�`���^���"x��H��7�P�ヵ~�&��X�j|�4�a%"����Q{��峄T*�	�%�6�G�|ZN�_خb�b��� =h�D�A����`��BX���Ͽ���'>�d���B���^�§!(>�P�wփ�No{ÿw����_��:�q����=||����FY�M���{��jw�����.����������y2Z�Pqظ��{��w��^4z��~�W�n�4n>1�<<v�5��_��X�Q_*AX�S�ݒW����d&s�Y9K.y���T��8.ed�2���3��0*f$Y�fĩԤ��/5dɲ��$��A�p/ �˓R�+j6S)gE�N˂m��ȼB�,m8��|�wuנ�p&�g� �U�!q�܊P���U\��N�t8��u�����p���dx���!E~l.q�q��s�l��dz:+�է�v�c���n�4��an�� @�3e�ӜcP�w�c4��ơ�(yVJ�����|(��J�'yx���PW��/�9a �I--Ȯ�8��7A4�""IՊ�7��[3HB&f�;�oV�������r+�7�  