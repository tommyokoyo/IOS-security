ios_static_analysis(){
    #Checking for stack canaries
    echo 'PIE (Position Independent Executable):'
    otool -Iv $1 | grep 'PIE'
    echo '---'
    echo 'Stack Canaries:'
    otool -I -v $1 | grep stack_chk
    echo '---'
    echo 'ARC (Automatic Reference Counting):'
    otool -I -v $1 | grep objc_release
    echo '---'
    echo 'Encrypted Binary:'
    otool -arch all -Vl $1 | grep -A5 LC_ENCRYPT
    echo '---'
    echo 'Weak Hashing Algorithms:'
    echo '_MD5:'
    otool -Iv $1 | grep -w "_CC_MD5"
    echo '_SHA1:'
    otool -Iv $1 | grep -w "_CC_SHA1"
    echo '---'
    echo 'Insecure Random Functions:'
    echo '_random:'
    otool -Iv $1 | grep -w "_random"
    echo '_srand:'
    otool -Iv $1 | grep -w "_srand"
    echo '_rand:'
    otool -Iv $1 | grep -w "_rand"
    echo '---'
    echo 'Insecure Malloc Function:'
    otool -Iv $1 | grep -w "_malloc"
    echo '---'
    echo 'Insecure and Vulnerable Functions:'
    echo '_gets:'
    otool -Iv $1 | grep -w "_gets"
    echo '_memcpy:'
    otool -Iv $1 | grep -w "_memcpy"
    echo '_strncpy:'
    otool -Iv $1 | grep -w "_strncpy"
    echo '_strlen:'
    otool -Iv $1 | grep -w "_strlen"
    echo '_vsnprintf:'
    otool -Iv $1 | grep -w "_vsnprintf"
    echo '_sscanf:'
    otool -Iv $1 | grep -w "_sscanf"
    echo '_strtok:'
    otool -Iv $1 | grep -w "_strtok"
    echo '_alloca:'
    otool -Iv $1 | grep -w "_alloca"
    echo '_sprintf:'
    otool -Iv $1 | grep -w "_sprintf"
    echo '_printf:'
    otool -Iv $1 | grep -w "_printf"
    echo '_vsprintf:'
    otool -Iv $1 | grep -w "_vsprintf"
    echo 'I am Done...'

}