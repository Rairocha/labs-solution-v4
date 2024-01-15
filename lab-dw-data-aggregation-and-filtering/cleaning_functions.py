def clean_number_complaints_python(num):
    if isinstance(num, str):
        return int(num.split('/')[1])
    return 0

def remove_plural(e):
    if isinstance(e,str):
        if e.endswith('s'):
            return e[:-1]
        
    return e