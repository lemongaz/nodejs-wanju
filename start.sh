#!/bin/sh
skip=49

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

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�J�dstart.sh �YkS�����x� pYI(
N�6��`D��Sc�,�GҚծ�q+��ƭM�$n��i3u�����)c�V���svW��i&;�����^�{=碋�]�׃R���_T�����;_;����T7wub|4;5<;�
������n�rT,����C��dć�}�-����8�⒬H(хP���r
!���D��jQ��k	9�NԱґ:��٠ S�	���U���g|s�w�����?;΋�q��G;��?*���ܭ<��y�p@ӏ�6���o���B��oR�b3�z�h�u�җ�����@��JRu[Ω���^���FYCʹDUEx�Za���L�N���z}dt��J��*�^{��q�8�>s�>�&Go�ggF�2:�������l��џ�t�Ds++�Xv���	w�|st�٫�G��OY8�~~���o��ܮ<�W��]�S��Y_&� ���[��ى�av�jq�^yg(;�n�!Γ]�/�947=��rX��,�d&�Ѽb�ň��5\�r��*MlFU�¦��eM�E9H$��f�bQJ�0��lv����M���f4`�o�)G5�V���u�Y��̬��ΪuI�ta�����E�x����7'�z'{�y tA�}`U��x��7u��.���]�g��:�*Ywu�U��T�~_y�%c��IKk�j�[&Z@��dR#uVM*>2�H0r-8HV1.��VR������P"���x:H&�l���v�]N�
{��(j2�H��^�ʸ�lU�7��d~:9��^�>��)�`N�t�])`i�\�c)&ˢ���*��k�4��D��_d�J2�O�����Q�Ѝ$����`��t�)��&G��K��5��QZ��8��[1�� ����E��b?ݐ�Q��C�"��.��ۍ{�TRW\jG��=�Pp}ȫ5�R��!	㉦����A	�<8�FB;͔�I�]A���@z�NHD��F�=J5R$�G.~z�|;��O�_P�ۀHt�5��:��~��{�����Q�˂а�,����un�t<� H�A��v(,�j��F�6t��ФBQ��VZW9M/إ�Ρ%�Ύd��ۀ���<T+\(~�w�'l���<!��_�N��[-���Ӳ�M�yQnDt0��&b�m$[+��|ꈹ�sѓ@-�L,�%� d6ӝi�ɇ�iYf����~�fmM�����u;�<b_�zz�O��3��Ʌ43ƾ6��(j�,�ʇE�TI�������.^D���I�PQɛ��yf��H�f_��������t������,Bƚ���)�'�	����%T�,�q��7�i&�Ft�"�0<��Lv$s}x|�������sSuIT	}�X,����L��N`|f�f2KD��8� 3�H��ǂR��0]C�m�0,�ZNɟ`�m����W�͙���燅1�]QXK-��c�c�ƈyS=�0�P�v��hm++ٵ��6<M3�hЌ��$�f�q��.�e�{��@�`�����y�� o^���̌�H��7Nik�Z[k
��� ��B ��+y�׫u��m��G/�O��_T�z���ʯw��0�H�M莸�Mw�P	��#��M@�{���Q�C)��&w���On�9���)�rj�{H��XR����V#��G���%8��`[��H��:"�y(~$憳�}� �J����h����*j�ք��^��d��#A�x�;A���|�������;�D�>�8>����Є� }���d��;��L��%B�_>�~�,X�,Aˇs�u�Vsr%3fDa���Z����#�G�B����������4�*u`��wT�ñ��̇`�G�RF����EH��:�A���PF<y��Z�`E�,���1B �?�q�y�پ[��ӳM���oW�}�����I$!�D�$XN�UI�5�q���WKъA�('@�"��D��n�����$X�]󜻻`N��3������p���q�T|�D1���0׏5���2��J�a@��b�><k=|�h�ӈ��C����hQO����3FU���=�6 F�G�sNc�]:+dDS3d�3@�y������oA53��:�\���s��&RA��ǰ�$�.1P����;��5���E5^��Nu��5���I�|o;�ŭ���6Y(pc�Kn�g�~��������m;��P���'��G���G{���/|(ƹ�{{�����;�ۇ�M�X'b��Z^�|��3cs����DÙ�ퟑPDo#�_1u�-���h$����?4K��n  