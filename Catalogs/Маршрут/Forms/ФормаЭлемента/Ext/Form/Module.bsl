﻿   &НаКлиенте
Процедура ДобавитьКартинку(Команда)
ИмяФайла = "";
ПутьФайла = "";
//Вызываем Диалоговое окно и помещаем файл Картинки из локальной файловой системы во временное хранилище
Если ПоместитьФайл(ПутьФайла, , ИмяФайла, Истина) = Истина Тогда
 
//в строковый реквизит ФОТО нашей формы сохраняем ссылку на Картинку во временном хранилище
Фото = ПутьФайла;
//для создания нового элемента в Справочнике Файлы и записи Картинки в его реквизит Файл
//переходим на сервер с помощью вызова серверной процедуры
УстановитьКартинку();
КонецЕсли; 
//условие ЕСЛИ нужно для того, чтобы если пользователь отказался от выбора файла
//мы не вызывали серверную процедуру УстановитьКартинку()
КонецПроцедуры   

&НаСервере
Процедура УстановитьКартинку()
//создаем новый элемент в Справочнике Файлы
НовыйФайлКартинки = Справочники.Файлы.СоздатьЭлемент();
//в реквизит СправочникаФайлы Файл помещаем выбранную ранее Картинку
НовыйФайлКартинки.Файл = Новый ХранилищеЗначения(ПолучитьИзВременногоХранилища(Фото));
Фото = ПоместитьВоВременноеХранилище(НовыйФайлКартинки.Файл.Получить());
//записываем новый элемент справочника Файлы
НовыйФайлКартинки.Записать();

//устанавливаем значение реквизита Картинка Справочника Сотрудники
Объект.Картинка = НовыйФайлКартинки.Ссылка;
КонецПроцедуры   

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
//отображение картинки при открытии формы справочника
Фото = ПолучитьНавигационнуюСсылку(Объект.Картинка, "Файл");

//устанавливаем автомасштаб для картинки
Элементы.Фото.РазмерКартинки = РазмерКартинки.АвтоРазмер;
КонецПроцедуры

&НаКлиенте
Процедура УдалитьКартинку(Команда)

ЭтотОбъект.АдресКартинки = "";
УдалениеКартинки();

КонецПроцедуры

&НаСервере
Процедура УдалениеКартинки()
        
    ОчисткаХранилища = РеквизитФормыВЗначение("Объект");
      ОчисткаХранилища.Картинка = Новый ХранилищеЗначения(Неопределено);
    ОчисткаХранилища.Записать();
    ЗначениеВРеквизитФормы(ОчисткаХранилища, "Объект")
        
КонецПроцедуры