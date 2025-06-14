#!/bin/bash
outdir="encryptedfiles"
plaindir="decryptedfiles"
if [ ! -d "$outdir" ]; then
    # Create the encrypted files directory if it doesn't exist
    mkdir "$outdir"
else
    # If the directory exists, check if it's empty
    if [ "$(ls -A "$outdir")" ]; then
        # If the directory is not empty, clear its contents
        rm -rf "$outdir"/*
    fi
fi
if [ ! -d "$plaindir" ]; then
    # Create the decrypted files directory if it doesn't exist
    mkdir "$plaindir"
else
    # If the directory exists, check if it's empty
    if [ "$(ls -A "$plaindir")" ]; then
        # If the directory is not empty, clear its contents
        rm -rf "$plaindir"/*
    fi
fi


echo Test 1
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.1 -port=5000 -tempfile=encryptedfiles/Test1-test-doc.docx -outfile=decryptedfiles/Test1-decrypted-test-doc.docx -privateAlias=ServerKey -publicAlias=Alice -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test1-server-output.txt &	
test1_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.1 -port=5000 -infile=tests/test-doc.docx -iv=7374726F6E676261646D616473616473 -aeskey=66B52DE97FA36AFC713DF1B9B33A9753 -privateAlias=AliceKey -publicAlias=Server -keystore=AliceKeyStore.p12 -pwd=alicepwd > Test1-client-output.txt	
sleep 3
if ps -p $test1_receiver_pid > /dev/null; then
kill $test1_receiver_pid
fi

echo Test 2
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.2 -port=5001 -tempfile=encryptedfiles/Test2-Fizzers.pdf -outfile=decryptedfiles/Test2-decrypted-Fizzers.pdf -privateAlias=ServerKey -publicAlias=Alice -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test2-server-output.txt &	
test2_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.2 -port=5001 -infile=tests/Fizzers.pdf -iv=7374726F6E676261646D616473616473 -aeskey=36DDEA1CD9A920E3E5EA0BFC1D83B90B -privateAlias=AliceKey -publicAlias=Server -keystore=AliceKeyStore.p12 -pwd=alicepwd > Test2-client-output.txt	
sleep 3
if ps -p $test2_receiver_pid > /dev/null; then
kill $test2_receiver_pid
fi

echo Test 3
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.3 -port=5002 -tempfile=encryptedfiles/Test3-test-doc.docx -outfile=decryptedfiles/Test3-decrypted-test-doc.docx -privateAlias=ServerKey -publicAlias=Bob -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test3-server-output.txt &	
test3_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.3 -port=5002 -infile=tests/test-doc.docx -iv=7374726F6E676261646D616473616473 -aeskey=CE178FFD3838B427B688CCF619E337F5 -privateAlias=BobKey -publicAlias=Server -keystore=BobKeyStore.p12 -pwd=bobpwd > Test3-client-output.txt	
sleep 3
if ps -p $test3_receiver_pid > /dev/null; then
kill $test3_receiver_pid
fi

echo Test 4
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.4 -port=5003 -tempfile=encryptedfiles/Test4-test-doc.docx -outfile=decryptedfiles/Test4-decrypted-test-doc.docx -privateAlias=ServerKey -publicAlias=Bob -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test4-server-output.txt &	
test4_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.4 -port=5003 -infile=tests/test-doc.docx -iv=736576656E6A756E696F726D696E7473 -aeskey=17F28536BDDC903DEAEF3A0DA6867BCCF0EB8A369BF40794 -privateAlias=BobKey -publicAlias=Server -keystore=BobKeyStore.p12 -pwd=bobpwd > Test4-client-output.txt	
sleep 3
if ps -p $test4_receiver_pid > /dev/null; then
kill $test4_receiver_pid
fi

echo Test 5
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.5 -port=5004 -tempfile=encryptedfiles/Test5-Fizzers.pdf -outfile=decryptedfiles/Test5-decrypted-Fizzers.pdf -privateAlias=ServerKey -publicAlias=Alice -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test5-server-output.txt &	
test5_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.5 -port=5004 -infile=tests/Fizzers.pdf -iv=736576656E6A756E696F726D696E7473 -aeskey=78DA8C0E14C7519E235F18C39E940AECD73390094BC658C8 -privateAlias=AliceKey -publicAlias=Server -keystore=AliceKeyStore.p12 -pwd=alicepwd > Test5-client-output.txt	
sleep 3
if ps -p $test5_receiver_pid > /dev/null; then
kill $test5_receiver_pid
fi

echo Test 6
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.6 -port=5005 -tempfile=encryptedfiles/Test6-Fizzers.pdf -outfile=decryptedfiles/Test6-decrypted-Fizzers.pdf -privateAlias=ServerKey -publicAlias=Alice -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test6-server-output.txt &	
test6_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.6 -port=5005 -infile=tests/Fizzers.pdf -iv=736576656E6A756E696F726D696E7473 -aeskey=20F3519914DD21D39A44F8DAB171B559CCDEBEBEB6BD8AFEBF2B3E5A4EAF960B -privateAlias=AliceKey -publicAlias=Server -keystore=AliceKeyStore.p12 -pwd=alicepwd > Test6-client-output.txt	
sleep 3
if ps -p $test6_receiver_pid > /dev/null; then
kill $test6_receiver_pid
fi

echo Test 7
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.7 -port=5006 -tempfile=encryptedfiles/Test7-test-doc.docx -outfile=decryptedfiles/Test7-decrypted-test-doc.docx -privateAlias=ServerKey -publicAlias=Bob -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test7-server-output.txt &	
test7_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.7 -port=5006 -infile=tests/test-doc.docx -iv=736576656E6A756E696F726D696E7473 -aeskey=22BA0AD25F26BBC5F7D358B9D14BE4655928452EE5FB0C30E9023418FC7A0DF4 -privateAlias=BobKey -publicAlias=Server -keystore=BobKeyStore.p12 -pwd=bobpwd > Test7-client-output.txt	
sleep 3
if ps -p $test7_receiver_pid > /dev/null; then
kill $test7_receiver_pid
fi

echo Test 8
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.8 -port=5007 -tempfile=encryptedfiles/Test8-Fizzers.pdf -outfile=decryptedfiles/Test8-decrypted-Fizzers.pdf -privateAlias=ServerKey -publicAlias=Bob -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test8-server-output.txt &	
test8_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.8 -port=5007 -infile=tests/Fizzers.pdf -iv=7374726F6E676261646D616473616473 -aeskey=418A63A385C877DD9AB7ECBD11521476 -privateAlias=BobKey -publicAlias=Server -keystore=BobKeyStore.p12 -pwd=bobpwd > Test8-client-output.txt	
sleep 3
if ps -p $test8_receiver_pid > /dev/null; then
kill $test8_receiver_pid
fi

echo Test 9
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.9 -port=5008 -tempfile=encryptedfiles/Test9-test-doc.docx -outfile=decryptedfiles/Test9-decrypted-test-doc.docx -privateAlias=ServerKey -publicAlias=Alice -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test9-server-output.txt &	
test9_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.9 -port=5008 -infile=tests/test-doc.docx -iv=6974776173746865626573746F666D65 -aeskey=4C9B48A0DC8E0512DE866F1946D7F2204CD6C35FC95A539DB9A1AD6348DE266B -privateAlias=AliceKey -publicAlias=Server -keystore=AliceKeyStore.p12 -pwd=alicepwd > Test9-client-output.txt	
sleep 3
if ps -p $test9_receiver_pid > /dev/null; then
kill $test9_receiver_pid
fi

echo Test 10
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.10 -port=5009 -tempfile=encryptedfiles/Test10-Fizzers.pdf -outfile=decryptedfiles/Test10-decrypted-Fizzers.pdf -privateAlias=ServerKey -publicAlias=Alice -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test10-server-output.txt &	
test10_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.10 -port=5009 -infile=tests/Fizzers.pdf -iv=7374726F6E676261646D616473616473 -aeskey=7767FC39C396B557DE45CA675BB1850D -privateAlias=AliceKey -publicAlias=Server -keystore=AliceKeyStore.p12 -pwd=alicepwd > Test10-client-output.txt	
sleep 3
if ps -p $test10_receiver_pid > /dev/null; then
kill $test10_receiver_pid
fi

echo Test 11
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.11 -port=5010 -tempfile=encryptedfiles/Test11-test-doc.docx -outfile=decryptedfiles/Test11-decrypted-test-doc.docx -privateAlias=ServerKey -publicAlias=Bob -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test11-server-output.txt &	
test11_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.11 -port=5010 -infile=tests/test-doc.docx -iv=7374726F6E676261646D616473616473 -aeskey=149B71889F1961699676255D4548BA8A -privateAlias=BobKey -publicAlias=Server -keystore=BobKeyStore.p12 -pwd=bobpwd > Test11-client-output.txt	
sleep 3
if ps -p $test11_receiver_pid > /dev/null; then
kill $test11_receiver_pid
fi

echo Test 12
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.12 -port=5011 -tempfile=encryptedfiles/Test12-Fizzers.pdf -outfile=decryptedfiles/Test12-decrypted-Fizzers.pdf -privateAlias=ServerKey -publicAlias=Bob -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test12-server-output.txt &	
test12_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.12 -port=5011 -infile=tests/Fizzers.pdf -iv=7374726F6E676261646D616473616473 -aeskey=F326373282A3A2250B509FDD377634BB -privateAlias=BobKey -publicAlias=Server -keystore=BobKeyStore.p12 -pwd=bobpwd > Test12-client-output.txt	
sleep 3
if ps -p $test12_receiver_pid > /dev/null; then
kill $test12_receiver_pid
fi

echo Test 13
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.13 -port=5012 -tempfile=encryptedfiles/Test13-Fizzers.pdf -outfile=decryptedfiles/Test13-decrypted-Fizzers.pdf -privateAlias=ServerKey -publicAlias=Alice -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test13-server-output.txt &	
test13_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.13 -port=5012 -infile=tests/Fizzers.pdf -iv=736576656E6A756E696F726D696E7473 -aeskey=1FCA79010000ED602D175553F7922AF9E540737488D0CD26 -privateAlias=AliceKey -publicAlias=Server -keystore=AliceKeyStore.p12 -pwd=alicepwd > Test13-client-output.txt	
sleep 3
if ps -p $test13_receiver_pid > /dev/null; then
kill $test13_receiver_pid
fi

echo Test 14
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.14 -port=5013 -tempfile=encryptedfiles/Test14-test-doc.docx -outfile=decryptedfiles/Test14-decrypted-test-doc.docx -privateAlias=ServerKey -publicAlias=Alice -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test14-server-output.txt &	
test14_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.14 -port=5013 -infile=tests/test-doc.docx -iv=6974776173746865626573746F666D65 -aeskey=4105E50847674C2363A72138F95AA0DE64BC1F60879685747C5EFAD3CAC9AC9F -privateAlias=AliceKey -publicAlias=Server -keystore=AliceKeyStore.p12 -pwd=alicepwd > Test14-client-output.txt	
sleep 3
if ps -p $test14_receiver_pid > /dev/null; then
kill $test14_receiver_pid
fi

echo Test 15
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.15 -port=5014 -tempfile=encryptedfiles/Test15-test-doc.docx -outfile=decryptedfiles/Test15-decrypted-test-doc.docx -privateAlias=ServerKey -publicAlias=Bob -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test15-server-output.txt &	
test15_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.15 -port=5014 -infile=tests/test-doc.docx -iv=736576656E6A756E696F726D696E7473 -aeskey=0C0C49D48155947815CF4A49F72C86F4C3D40D97D4113DD1 -privateAlias=BobKey -publicAlias=Server -keystore=BobKeyStore.p12 -pwd=bobpwd > Test15-client-output.txt	
sleep 3
if ps -p $test15_receiver_pid > /dev/null; then
kill $test15_receiver_pid
fi

echo Test 16
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.16 -port=5015 -tempfile=encryptedfiles/Test16-test-doc.docx -outfile=decryptedfiles/Test16-decrypted-test-doc.docx -privateAlias=ServerKey -publicAlias=Bob -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test16-server-output.txt &	
test16_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.16 -port=5015 -infile=tests/test-doc.docx -iv=6974776173746865626573746F666D65 -aeskey=AF418405B33CEC1564112D9C0825FA60988BE820E01922E28AF41BB1E40E8185 -privateAlias=BobKey -publicAlias=Server -keystore=BobKeyStore.p12 -pwd=bobpwd > Test16-client-output.txt	
sleep 3
if ps -p $test16_receiver_pid > /dev/null; then
kill $test16_receiver_pid
fi

echo Test 17 Client Fail
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.17 -port=5016 -tempfile=encryptedfiles/Test17-test-doc.docx -outfile=decryptedfiles/Test17-decrypted-test-doc.docx -privateAlias=ServerKey -publicAlias=Alice -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test17-server-output.txt &	
test17_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -port=5016 -infile=tests/test-doc.docx -iv=7374726F6E676261646D616473616473 -aeskey=6B696C6C696E67796F756775796A6F6E -privateAlias=AliceKey -publicAlias=Server -keystore=AliceKeyStore.p12 -pwd=alicepwd > Test17-client-output.txt	
sleep 3
if ps -p $test17_receiver_pid > /dev/null; then
kill $test17_receiver_pid
fi

echo Test 18 Client Fail
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.18 -port=5017 -tempfile=encryptedfiles/Test18-Fizzers.pdf -outfile=decryptedfiles/Test18-decrypted-Fizzers.pdf -privateAlias=ServerKey -publicAlias=Alice -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test18-server-output.txt &	
test18_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.18 -port=5017 -infile=tests/Fizzers.pdf -iv=7374726F6E676261646D616473616473 -aeskey=6B696C6C696E67796F756775796A6F6E -privateAlias=AliceKey -publicAlias=Server -keystore=AliceKeyStore.p12 -pwd=bobpwd > Test18-client-output.txt	
sleep 3
if ps -p $test18_receiver_pid > /dev/null; then
kill $test18_receiver_pid
fi

echo Test 19 Client Fail
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.19 -port=5018 -tempfile=encryptedfiles/Test19-test-doc.docx -outfile=decryptedfiles/Test19-decrypted-test-doc.docx -privateAlias=ServerKey -publicAlias=Bob -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test19-server-output.txt &	
test19_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.19 -port=5018 -infile=tests/test-doc.docx -iv=7374726F6E676261646D616473616473 -aeskey=6B696C6C696E67796F756775796A6F6E -privateAlias=BobKey -publicAlias=Alice -keystore=BobKeyStore.p12 -pwd=bobpwd > Test19-client-output.txt	
sleep 3
if ps -p $test19_receiver_pid > /dev/null; then
kill $test19_receiver_pid
fi

echo Test 20 Server Fail
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.20 -port=5019 -outfile=decryptedfiles/Test20-decrypted-Fizzers.pdf -privateAlias=ServerKey -publicAlias=Bob -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test20-server-output.txt &	
test20_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.20 -port=5019 -infile=tests/Fizzers.pdf -iv=736576656E6A756E696F726D696E7473 -aeskey=7A696C6C6F77777377696E7377617273696E746F6865617271756F746171696B -privateAlias=BobKey -publicAlias=Server -keystore=BobKeyStore.p12 -pwd=bobpwd > Test20-client-output.txt	
sleep 3
if ps -p $test20_receiver_pid > /dev/null; then
kill $test20_receiver_pid
fi

echo Test 21 Server Fail
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.21 -port=5020 -tempfile=encryptedfiles/Test21-test-doc.docx -outfile=decryptedfiles/Test21-decrypted-test-doc.docx -privateAlias=ServerKey -publicAlias=Bob -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test21-server-output.txt &	
test21_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.21 -port=5020 -infile=tests/test-doc.docx -iv=7374726F6E676261646D616473616473 -aeskey=6B696C6C696E67796F756775796A6F6E -privateAlias=AliceKey -publicAlias=Server -keystore=AliceKeyStore.p12 -pwd=alicepwd > Test21-client-output.txt	
sleep 3
if ps -p $test21_receiver_pid > /dev/null; then
kill $test21_receiver_pid
fi

echo Test 22 Server Fail
	java -jar CertificateSigningServer-5785.jar -ip=127.0.0.22 -port=5021 -tempfile=encryptedfiles/Test22-Fizzers.pdf -outfile=decryptedfiles/Test22-decrypted-Fizzers.pdf -privateAlias=AliceKey -publicAlias=Alice -keystore=ServerKeyStore.p12 -pwd=serverpwd > Test22-server-output.txt &	
test22_receiver_pid=$!
sleep 3 
	java -jar CertificateSigningClient-5785.jar -dest=127.0.0.22 -port=5021 -infile=tests/Fizzers.pdf -iv=736576656E6A756E696F726D696E7473 -aeskey=7A696C6C6F77777377696E7377617273696E746F68656172 -privateAlias=AliceKey -publicAlias=Server -keystore=AliceKeyStore.p12 -pwd=alicepwd > Test22-client-output.txt	
sleep 3
if ps -p $test22_receiver_pid > /dev/null; then
kill $test22_receiver_pid
fi


sha256sum "$outdir"/* > "$outdir"/encrypted-files.sha256
sha256sum "$plaindir"/* > "$plaindir"/decrypted-files.sha256
sha256sum -c ./encrypted-files.sha256
sha256sum -c ./decrypted-files.sha256
