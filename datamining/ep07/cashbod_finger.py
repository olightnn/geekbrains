import shutil
import os
import PyPDF2
from PIL import Image
import pytesseract
import time

pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'

pdf_file_path = 'data_for_parse/18162 Поверка.pdf'
image_file_path = os.getcwd() + '\\' + 'data_for_parse\\image'
error_file_path = os.getcwd() + '\\' + 'data_for_parse\\error'

# todo отсортировать jpg и pdf
def sort_files(file_path):
    os.chdir(file_path)
    #os.walk()
    for item in os.listdir():
        if os.path.isdir(item):
            path = os.getcwd() + '//' + item
            os.chdir(path)
            for item_dir in os.listdir():
                sort_image_error(item_dir)
        else:
            sort_image_error(item)

def sort_image_error(file_un):
    if file_un.endswith(".jpg"):
        shutil.copyfile(os.path.join(os.getcwd(), file_un), os.path.join(image_file_path, file_un), follow_symlinks=True)
    else:
        shutil.copyfile(os.path.join(os.getcwd(), file_un), os.path.join(error_file_path, file_un), follow_symlinks=True)

# todo извлечь jpg из pdf и сохранить в папке изображений
def extract_pdf_image(pdf_path):
    try:
        pdf_file = PyPDF2.PdfFileReader(open(pdf_path, "rb"), strict=False)
    except PyPDF2.utils.PdfReadError as e:
        return None
    except FileNotFoundError as e:
        return None

    result = []

    for page_num in range(0, pdf_file.getNumPages()):
        page = pdf_file.getPage(page_num)
        page_obj = page['/Resources']['/XObject'].getObject()
        if page_obj.get('/Im0') is not None:
            if page_obj['/Im0'].get('/Subtype') == "/Image":
                size = (page_obj['/Im0']['/Width'], page_obj['/Im0']['/Height'])
                data = page_obj['/Im0']._data
                if page_obj['/Im0']['/ColorSpace'] == '/DeviceRGB':
                    mode = 'RGB'
                else:
                    mode = 'P'

                if page_obj['/Im0']['/Filter'] == '/FlateDecode':
                    file_type = 'png'
                elif page_obj['/Im0']['/Filter'] == '/DCTDecode':
                    file_type = 'jpg'
                elif page_obj['/Im0']['/Filter'] == '/JPXDecode':
                    file_type = 'jp2'
                else:
                    file_type = 'bmp'

                result_stric = {
                    'page': page_num,
                    'size': size,
                    'data': data,
                    'mode': mode,
                    'file_type': file_type,
                }
                result.append(result_stric)
        elif page_obj.get('/Im1') is not None:
            if page_obj['/Im1'].get('/Subtype') == "/Image":
                size = (page_obj['/Im1']['/Width'], page_obj['/Im1']['/Height'])
                data = page_obj['/Im1']._data
                if page_obj['/Im1']['/ColorSpace'] == '/DeviceRGB':
                    mode = 'RGB'
                else:
                    mode = 'P'

                if page_obj['/Im1']['/Filter'] == '/FlateDecode':
                    file_type = 'png'
                elif page_obj['/Im1']['/Filter'] == '/DCTDecode':
                    file_type = 'jpg'
                elif page_obj['/Im1']['/Filter'] == '/JPXDecode':
                    file_type = 'jp2'
                else:
                    file_type = 'bmp'

                result_stric = {
                    'page': page_num,
                    'size': size,
                    'data': data,
                    'mode': mode,
                    'file_type': file_type,
                }
                result.append(result_stric)

    return result

def save_pdf_image(file_name, f_path, *pdf_strict):
    for item in pdf_strict:
        name = f"{file_name}_#_{item['page']}.{item['file_type']}"

        with open(f"{f_path}/{name}", "wb") as image:
            image.write(item['data'])

# todo не забыть про формат имен файлов

# todo Извлечь номер кассы из поля

def extract_number(file_path):
    img_obj = Image.open(file_path)
    text = pytesseract.image_to_string(img_obj, lang = 'rus')
    result = []
    pattern = 'заводской (серийный) номер'
    pattern2 = 'аводской номер (номера)'
    for idx, line in  enumerate(text.split('\n')):
        if line.lower().find(pattern) + 1 or line.lower().find(pattern2) + 1:
            eng_text = pytesseract.image_to_string(img_obj, lang = 'eng')
            number = eng_text.split('\n')[idx].split(' ')[-1]
            result.append(number)

    # todo при отсутствии распознавания вернуть соответсвующее сообщение или error
    return result

# todo сохранить все в БД MONGO
file_name = '18162 Поверка'
image_path = "data_for_parse/image"
img_file_path = 'data_for_parse/image/18162 Поверка_#_0.jpg'
file_path = 'data_for_parse'
if __name__ == '__main__':
    #pdf_result = extract_pdf_image(pdf_file_path)
    #save_pdf_image(file_name, image_path, *pdf_result)
    #res = extract_number(img_file_path)
    rem = sort_files(file_path)
    print(1)
