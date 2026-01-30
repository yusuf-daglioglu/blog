# 💻 HTTP Strict Transport Security

📎 digital-security 📎 https 📎 ssl 📎 web-security

## 🔒 HTTP'den HTTPS'e yönlendirme

`HTTP` ile gidilen site, dönüş değerinde `HTTPS`'e yönlendirme isteğinde bulunur. web tarayıcıda kullanıcıyı `HTTPS`'e yönlendirir. eğer arada trafiğimizi izleyip manipüle eden birileri varsa, bu isteğin cevabında tarayıcı `HTTPS`'e yönlendirme yapmaz. yapmaz ise, normal `HTTP` sitenin get isteğinin cevabı ile sayfada gezinilir. artık son kullanıcı `HTTP` ile iletişime devam edeceği için tüm iletişim baştan sona izlenebilir.

## 🔒 "HTTPS everywhere" vs "smart https"

Web tarayıcı eklentileridir. Smart; her URL'yi sorgulamadan `HTTPS`'e çevirir. Eğer herhangi bir cevap gelirse siteye gider, yoksa `HTTP` olana gider. Fakat "`HTTPS everywhere`" her site için önceden rule set tutar ve aşağıdaki gibi gelişmiş yönlendirmelerde yapabilir.

```text
http://fr.wikipedia.org/wiki/Chose

https://secure.wikimedia.org/wikipedia/fr/wiki/Chose
```

## 🔒 HSTS (or HTTP Strict Transport Security)

Kullanıcıyı `HTTP`'den `HTTPS`'e yönlendirildiğinde sunucu bu header'ı döner:

> Strict-Transport-Security: max-age=16070400; includeSubDomains

`max-age` süresinde tarayıcı son kullanıcı `HTTP`'ye gitmek istese bile HTTPS'e otomatik yönlendirecektir.

## 🔒 Preloaded HSTS sites

`HSTS` için bir kere olsun siteye gitmek gerekiyor. bunu da yapmaya gerek kalmaması için tüm web tarayıcıların ortak tuttuğu bir liste var:

<https://cs.chromium.org/chromium/src/net/http/transport_security_state_static.json>

dosya içeriği çok büyük. bir kısmı:

```json
{ "name": "qualitymudjacking.com", "policy": "bulk-1-year", "mode": "force-https", "include_subdomains": true },
{ "name": "qualitypiering.com", "policy": "bulk-1-year", "mode": "force-https", "include_subdomains": true },
{ "name": "qualitypolyjacking.com", "policy": "bulk-1-year", "mode": "force-https", "include_subdomains": true },
{ "name": "qualitywaterproofingco.com", "policy": "bulk-1-year", "mode": "force-https", "include_subdomains": true },
{ "name": "quanquan.space", "policy": "bulk-1-year", "mode": "force-https", "include_subdomains": true },
{ "name": "qulixqa.com", "policy": "bulk-1-year", "mode": "force-https", "include_subdomains": true },
```

Bu listeye kaydolmak ücretsiz. bu bilgileri web tarayıcıları sürekli lokalde güncel tutuyor ve bu listedeki sitelere gitmek isteyen kullanıcıları direk `HTTPS`'e yönlendiriyor.

## 🔒 Diğer makaleler

Yazılım güvenliği ile ilgili diğer yazılarıma buradan ulaşabilirsiniz:

<https://github.com/yusuf-daglioglu/tutorials/tree/master/tutorials> `security` prefix'li dosyalar.

<br><br>

<b>Lisans:</b>

Bu makale <a href="https://creativecommons.org/licenses/by-sa/4.0/" target="_blank" rel="license noopener">
<b>Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)</b>
</a> lisansı ile lisanslanmıştır.

<b>License:</b>

This article is licensed under the <a href="https://creativecommons.org/licenses/by-sa/4.0/" target="_blank" rel="license noopener">
<b>Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)</b>
</a> license.

<br><br>