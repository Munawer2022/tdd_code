# gdrive_upload.py
import argparse
import json
import os
from google.oauth2 import service_account
from googleapiclient.discovery import build
from googleapiclient.http import MediaFileUpload

def upload_file(service, folder_id, file_path):
    file_metadata = {
        'name': os.path.basename(file_path),
        'parents': [folder_id]
    }
    media = MediaFileUpload(file_path, resumable=True)
    file = service.files().create(body=file_metadata, media_body=media, fields='id, webViewLink').execute()
    return file.get('webViewLink')

def main():
    parser = argparse.ArgumentParser(description='Upload files to Google Drive')
    parser.add_argument('file_path', type=str, help='Path to the file to upload')
    parser.add_argument('folder_id', type=str, help='Google Drive folder ID')
    parser.add_argument('credentials_json', type=str, help='Path to the credentials JSON file')
    args = parser.parse_args()

    credentials = service_account.Credentials.from_service_account_file(args.credentials_json, scopes=['https://www.googleapis.com/auth/drive.file'])
    service = build('drive', 'v3', credentials=credentials)

    link = upload_file(service, args.folder_id, args.file_path)
    print(link)

if __name__ == '__main__':
    main()
