﻿   &НаСервереБезКонтекста
Функция ВызовРегистраДлительности(ДатаТек,ЭлементНомерМаршрута)Экспорт
	Отбор = Новый Структура;
	Отбор.Вставить("НомерМаршрута",ЭлементНомерМаршрута);
	Ресурсы = РегистрыСведений.ВремяМаршрутаТранспорта.ПолучитьПоследнее(ДатаТек,Отбор);
	Возврат Ресурсы.Длительность;
КонецФункции

&НаКлиенте
Процедура РасписаниеНомерМаршрутаПриИзменении(Элемент)
	ТекущиеДанные = Элементы.Расписание.ТекущиеДанные;
	ТекущиеДанные.ВремяПоездки = ВызовРегистраДлительности(ТекущаяДата(), ТекущиеДанные.НомерМаршрута); 
КонецПроцедуры

&НаКлиенте
Процедура РасписаниеВремяВыездаПриИзменении(Элемент)
ТекущиеДанные = Элементы.Расписание.ТекущиеДанные;
     РассчетВремени();
            ТекущиеДанные.ВремяПриезда = ТекущиеДанные.ВремяВыезда + (ТекущиеДанные.ВремяПоездки * 3600);
КонецПроцедуры

&НаКлиенте
Процедура РассчетВремени()
		ТекущиеДанные = Элементы.Расписание.ТекущиеДанные;
 ТекущиеДанные.ВремяПриезда = ТекущиеДанные.ВремяВыезда + (ТекущиеДанные.ВремяПоездки * 3600);
	КонецПроцедуры

&НаКлиенте
	Процедура РасписаниеВремяПриездаПриИзменении(Элемент)
	ТекущиеДанные = Элементы.Расписание.ТекущиеДанные;			
       ТекущиеДанные.ВремяПриезда = ТекущиеДанные.ВремяВыезда + (ТекущиеДанные.ВремяПоездки * 3600);
	РассчетВремени();
	КонецПроцедуры

&НаКлиенте
	Процедура РасписаниеВремяПоездкиПриИзменении(Элемент)
	РассчетВремени();	
	КонецПроцедуры
 