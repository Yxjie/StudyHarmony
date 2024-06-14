import preferences from '@ohos.data.preferences'
import hilog from '@ohos.hilog'

const PREFERENCES_NAME = 'sp_demo'
let context = getContext(this)

export default class PreferenceUtil {
  private preference: preferences.Preferences

  async getPreferencesFromStorage() {
    await preferences.getPreferences(context, PREFERENCES_NAME).then((data) => {
      this.preference = data
      hilog.info(0x0000, 'PreferenceUtil', 'Succeeded in getting preference')
    }).catch((error) => {
      hilog.error(0x0000, 'PreferenceUtil', '创建失败')
    })
  }

  async putPreference(key: string, data: string) {
    if (this.preference === null) {
      await this.getPreferencesFromStorage()
    }
    await this.preference.put(key, data).then(() => {
      hilog.info(0x0000, 'PreferenceUtil', 'save success')
    }).catch((error) => {
      hilog.error(0x0000, 'PreferenceUtil', '保存失败：' + error)
    })
    await this.preference.flush();
  }

  async getPreference(key: string) {
    let result = ''
    if (this.preference === null) {
      await this.getPreferencesFromStorage()
    }
    await this.preference.get(key, '').then((data) => {
      result = data.toString()
    }).catch((error) => {
      hilog.error(0x0000, 'PreferenceUtil', '获取失败：' + error)
    })
    return result
  }

  async deletePreference() {
    await preferences.deletePreferences(context, PREFERENCES_NAME).then(() => {
      hilog.info(0x0000, 'PreferenceUtil', 'delete preferences success')
    }).catch((error) => {
      hilog.error(0x0000, 'PreferenceUtil', '删除失败：' + error)
    })
    this.preference = null
  }
}