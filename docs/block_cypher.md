# Block Cipher

📎 digital-security 📎 cryptography

## 🔒 Stream cipher

Block şifrelemedeki gibi blok blok değilde, stream'den gelen her bilgiyi direk şifreleyen algoritmalara denir. Stream cipher'da genelde, en ufak birim bit veya byte olarak baz alınır. Stream cyper, block şifrelemeye alternatiftir. Block şifrelemede en ufak birim block'tur.

## 🔒 Blok Şifreleme (or Block Cipher)

Blok şifreleme kullanan algoritmalarda, şifrelenecek tüm mesaj 'block size' kadar bölünür. Her bölünen parça ayrı ayrı şifrelenerek, şifrelenmiş halleri birleştirilir.

Block şifrelemede, __block size__ ne kadar büyükse, şifrelemede o kadar güvenlik sağlanmış olur. Zira, blok uzunluğu büyükse, her bloğu ayrı ayrı tahminleme ile inceleyen hacker'a daha uzun bir çıktı kümesi vermiş oluruz.

Block size ile, şifrelemede kullanılacak anahtarın boyutunun bir ilişkisi olmak zorunda değildir (kişisel olarak ilişki olduğunu belirten bir kaynak okumadım).

Blok şifreleme kullanan birçok algoritma vardır. Fakat her blok şifrelemenin de birçok türevi/uzantısı vardır. Bunlar "__çalışma kipi (or mode of operation)__" olarak ta adlandırılırlar. örnek çalışma kipleri:

- ### 🔒 Elektronik kod defteri (or Electronic Codebook or ECB)

  Blok şifrelemenin en basitidir. Her blok bağımsızca şifrelenir ve sonrada yan yana dizilerek birleştirilir.

- ### 🔒 Şifre Blok Zincirlemesi (or Cipher Block Chaining or CBC)
  
  her blok bağımsız şifrelenir. fakat her blok şifrelenmeden önce, bir önceki blokun şifrelenmiş halini ile XOR'lanır (ve daha sonra şifrelenir).

  İlk bloğun öncesinde hiçbir blok olmadığı için, ilk blok manuel olarak verilecek "Initialization Vector" ile işleme tabi tutulur.

  CBC mode'unun dezavantajları (Aşağıdaki cümlelerin tersi, ECB'nin avantajlarıdır):

  - CPU her bloğu paralel şekilde şifreleme yapamaz. yani; şifrelerken yavaştır.

    Not: Hem CBC hem de ECB, decrypt işlemini her bloğu paralel şekilde işleterek yapabilir.

  - şifrelenmiş mesajda herhangi bir bloğu kaybedersek, mesajın kaybolan kısmından sonrasını açamayız.

  CBC mode'unun avantajları (Aşağıdaki cümlelerin tersi, ECB'nin dezavantajlarıdır):

  - Herhangi bir blok, farklı bir bloktaki ile aynı açık metni şifreliyor olsun (böyle denk gelmiş olsun). Buna rağmen farklı şifrelenmiş çıktı verecektir. Çünkü her block bir önceki blok ile de matematiksel işleme tabi tutulduğu için aynı çıktıyı vermez.

- ### 🔒 Yayılımlı Şifre Blok Zincirlemesi (or Propagating Cipher Block Chaining or PCBC or plaintext cipher-block chaining)

  CBC ile aynı mantıktadır. CBC; sadece bir önceki bloğun şifreli halini kullanırken, PCBC buna ek olarak; bir önceki bloğun açık halinden (şifrelenmemiş halinden) de yararlanır.

- ### 🔒 Şifre Geri Beslemeli (or Cipher FeedBack or CFB)

- ### 🔒 Çıktı Geri Beslemeli (or Output FeedBack or OFB)

- ### 🔒 Sayıcı Modunda Şifreleme (or Counter Mode Encryption or CTR)

  Bazı kaynaklarda sadece 'CTR mode'un kısaltması olduğundan "__CM__" olarak da kullanılmaktadır. Bazı kaynaklarda ise; "__integer counter mode (or ICM) and segmented integer counter (or SIC)__" olarak kullanılır.

## 🔒 Java Cipher

"algorithm/mode/padding" formatında "transformation" adı verilen string'i alır.

```java
Cipher c = javax.crypto.Cipher.getInstance("AES/CBC/PKCS5Padding");
```

Eğer getInstance'a sadece "AES" verilirse, bu durumda provider'ın sunduğu default değerler kullanılır.

## 🔒 ilklendirme vektörü (or starting variable or SV or Initialization Vector or IV or İV or ilklendirme değişkeni or başlangıç vektörü or BV)

IV, "salt" ile karıştırılmamalıdır. Farklı şeylerdir fakat aynı konsepte hizmet ederler.

'Salt'ta da olduğu gibi her şifrelemede farklı kullanılmalıdır ve data açılmak istendiği zaman kullanmak üzere DB'de saklanmalıdır. 'Salt' standart algoritmaların dökümantasyonunda belirtilen bir terim değil iken, IV direk algoritmanın kendisinde olan bir terimdir.

IV yerine key kullanılamaz mıydı? Eğer key IV yerine kullanılırsa, o zaman aynı plan-text'ler aynı şifrelenmiş bilgiyi üretir. Bu da güvenlik açığı meydana getirebilir.

Eğer şifreleme işleminde IV kullanılmazsa, CBC tabanlı algoritmalarının yapısı gereği, aynı veri şifrelendiğinde, şifrelenmiş verinin sadece ilk bloğu, aynı çıktıyı verir. kaynak: <https://richardwarrender.com/2016/04/encrypt-data-using-aes-and-256-bit-keys/> "IV – the bit twister" başlığı.

örnek:

openssl komutu ile bir mesajı şifreleyelim:

```sh
$ openssl enc -aes128 -k "secretpassword" -a -p -nosalt -iv 00
key="2034F6E32958647FDFF75D265B455EBF"
Hello Mr Warrender, I have some terrible news

VVklkPrL5fczxmu4vZ93BnfBBpU8BWK1IQhHF6JRKSNZJ7PvpcaE8K/Mkbx1xgHa
```

```sh
openssl enc -aes128 -k "secretpassword" -a -p -nosalt -iv 00
key="2034F6E32958647FDFF75D265B455EBF"
Hello Mr Warrender, This is good news

VVklkPrL5fczxmu4vZ93BkAsVA64MLd5uah+zTVzr0XlOONVgDEd7ZunyIIzhpAo
```

Farklı bir IV kullanırsam, ilk bloğu farklı bir çıktı alırım:

```sh
openssl enc -aes256 -k "secretpassword" -a -p -nosalt
key="2034F6E32958647FDFF75D265B455EBF40C80E6D597092B3A802B3E5863F878C"
iv =AD0ACC568C88C116D57B273D98FB92C0
Hello Mr Warrender, This is good news

9/0FGE21YYBl8NvlCp1Ft8j1V7BiIpCIlNa/zbYwL5LWyemd/7QEu0tkVz9/f0JG
```

CBC tabanlı algoritmalarının yapısı gereği hacker'ın elinde IV yok ise, key ile sadece ilk bloğu (mesajın ilk kısmını) açamaz. Diğer blokların hepsini açabilir. kaynak: <https://richardwarrender.com/2016/04/encrypt-data-using-aes-and-256-bit-keys/> "Wait... The IV is not a key!" başlığı.

Yukarıdaki cümleyi şöyle örneklendirerek anlatalım:

Şifrelerken her bloğu sırası ile şifreliyoruz:

```java
String fullPlainText = plainText1 + plainText2 + plainText3;

// Phase 1. We are creating the first block of encrypted text in this phase.
encryptedText1 = encryptFunction( xorFunction( plainText1, IV), KEY);

// Phase 2:
encryptedText2 = encryptFunction( xorFunction( plainText2, encryptedText1), KEY);

// Phase 3:
encryptedText3 = encryptFunction( xorFunction( plainText3, encryptedText2), KEY);

result = encryptedText1 + encryptedText2 + encryptedText3;
```

Şimdi ise şifrelenmiş veriyi, "KEY" kullanarak decrypt edelim:

```java
// Aşağıdaki blokların açılması işlemleri paralel yapılabilir.
// Sırası ile olmak zorunda değil. Fakat şifrelerken sırası ile yapılmak zorunda.

// Burası okunmadan önce XOR işleminin kurallarına bakılması gerekiyor şart (Başka dökümanda bu konu anlatıldı).

tempData3 = decryptFunction(cipherText3, KEY);
plainText3 = xorFunction(tempData3, cipherText2);

tempData2 = decryptFunction(cipherText2, KEY);
plainText2 = xorFunction(tempData2, cipherText1);

tempData1 = decryptFunction(cipherText1, KEY);
plainText1 = xorFunction(tempData1, IV); // In this line we need IV. Only "key" is not enough for this block.
```

## 🔒 Diğer makaleler

Yazılım güvenliği ile ilgili diğer yazılarıma buradan ulaşabilirsiniz:

- <https://github.com/yusuf-daglioglu/tutorials/blob/master/tutorials/security.md>

- <https://github.com/yusuf-daglioglu/tutorials/blob/master/tutorials/security_certificate.md>

- <https://github.com/yusuf-daglioglu/tutorials/blob/master/tutorials/security_cryptography.md>

- <https://github.com/yusuf-daglioglu/tutorials/blob/master/tutorials/security_jwt.md>

- <https://github.com/yusuf-daglioglu/tutorials/blob/master/tutorials/security_keycloak.md>

- <https://github.com/yusuf-daglioglu/tutorials/blob/master/tutorials/security_oauth.md>

- <https://github.com/yusuf-daglioglu/tutorials/blob/master/tutorials/security_random_numbers.md>

- <https://github.com/yusuf-daglioglu/tutorials/blob/master/tutorials/security_uuid.md>

- <https://github.com/yusuf-daglioglu/tutorials/blob/master/tutorials/java_spring_security.md>
