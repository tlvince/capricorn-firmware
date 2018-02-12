fastboot $* getvar product 2>&1 | grep "^product: *MSM8996_A7"

if [ $? -ne 0 ] ; then echo "Missmatching image and device"; exit 1; fi
fastboot $* flash xbl `dirname $0`/images/xbl.elf
if [ $? -ne 0 ] ; then echo "Flash xbl error"; exit 1; fi
fastboot $* flash xblbak `dirname $0`/images/xbl.elf
if [ $? -ne 0 ] ; then echo "Flash xblbak error"; exit 1; fi
fastboot $* flash tz `dirname $0`/images/tz.mbn
if [ $? -ne 0 ] ; then echo "Flash tz error"; exit 1; fi
fastboot $* flash tzbak `dirname $0`/images/tz.mbn
if [ $? -ne 0 ] ; then echo "Flash tzbak error"; exit 1; fi
fastboot $* flash hyp `dirname $0`/images/hyp.mbn
if [ $? -ne 0 ] ; then echo "Flash hyp error"; exit 1; fi
fastboot $* flash hypbak `dirname $0`/images/hyp.mbn
if [ $? -ne 0 ] ; then echo "Flash hypbak error"; exit 1; fi
fastboot $* flash rpm `dirname $0`/images/rpm.mbn
if [ $? -ne 0 ] ; then echo "Flash rpm error"; exit 1; fi
fastboot $* flash rpmbak `dirname $0`/images/rpm.mbn
if [ $? -ne 0 ] ; then echo "Flash rpmbak error"; exit 1; fi
fastboot $* flash aboot `dirname $0`/images/emmc_appsboot.mbn
if [ $? -ne 0 ] ; then echo "Flash aboot error"; exit 1; fi
fastboot $* flash abootbak `dirname $0`/images/emmc_appsboot.mbn
if [ $? -ne 0 ] ; then echo "Flash abootbak error"; exit 1; fi
fastboot $* flash pmic `dirname $0`/images/pmic.elf
if [ $? -ne 0 ] ; then echo "Flash pmic error"; exit 1; fi
fastboot $* flash pmicbak `dirname $0`/images/pmic.elf
if [ $? -ne 0 ] ; then echo "Flash pmicbak error"; exit 1; fi
fastboot $* flash devcfg `dirname $0`/images/devcfg.mbn
if [ $? -ne 0 ] ; then echo "Flash devcfg error"; exit 1; fi
fastboot $* flash devcfgbak `dirname $0`/images/devcfg.mbn
if [ $? -ne 0 ] ; then echo "Flash devcfgbak error"; exit 1; fi
fastboot $* flash bluetooth `dirname $0`/images/BTFM.bin
if [ $? -ne 0 ] ; then echo "Flash bluetooth error"; exit 1; fi
fastboot $* flash cmnlib `dirname $0`/images/cmnlib.mbn
if [ $? -ne 0 ] ; then echo "Flash cmnlib error"; exit 1; fi
fastboot $* flash cmnlibbak `dirname $0`/images/cmnlib.mbn
if [ $? -ne 0 ] ; then echo "Flash cmnlibbak error"; exit 1; fi
fastboot $* flash cmnlib64 `dirname $0`/images/cmnlib64.mbn
if [ $? -ne 0 ] ; then echo "Flash cmnlib64 error"; exit 1; fi
fastboot $* flash cmnlib64bak `dirname $0`/images/cmnlib64.mbn
if [ $? -ne 0 ] ; then echo "Flash cmnlib64bak error"; exit 1; fi
fastboot $* flash modem `dirname $0`/images/NON-HLOS.bin
if [ $? -ne 0 ] ; then echo "Flash modem error"; exit 1; fi
fastboot $* flash dsp `dirname $0`/images/adspso.bin
if [ $? -ne 0 ] ; then echo "Flash dsp error"; exit 1; fi
fastboot $* flash keymaster `dirname $0`/images/keymaster.mbn
if [ $? -ne 0 ] ; then echo "Flash keymaster error"; exit 1; fi
fastboot $* flash keymasterbak `dirname $0`/images/keymaster.mbn
if [ $? -ne 0 ] ; then echo "Flash keymasterbak error"; exit 1; fi
fastboot $* flash splash `dirname $0`/images/splash.img
if [ $? -ne 0 ] ; then echo "Flash splash error"; exit 1; fi
fastboot $* flash logo `dirname $0`/images/logo.img
if [ $? -ne 0 ] ; then echo "Flash logo error"; exit 1; fi
fastboot $* flash lksecapp `dirname $0`/images/lksecapp.mbn
if [ $? -ne 0 ] ; then echo "Flash lksecapp error"; exit 1; fi
fastboot $* flash lksecappbak `dirname $0`/images/lksecapp.mbn
if [ $? -ne 0 ] ; then echo "Flash lksecappbak error"; exit 1; fi

fastboot $* reboot
if [ $? -ne 0 ] ; then echo "Reboot error"; exit 1; fi
