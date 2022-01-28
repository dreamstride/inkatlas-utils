module InkTextureSample
import Codeware.Localization.*
import Codeware.UI.*

public class InkTextureSamplePopup extends InGamePopup {
	protected let m_header: ref<InGamePopupHeader>;

	protected let m_footer: ref<InGamePopupFooter>;

	protected let m_content: ref<InGamePopupContent>;

    protected let m_textures: ref<Textures>;

	protected let m_translator: ref<LocalizationSystem>;

	protected cb func OnCreate() -> Void {
		super.OnCreate();

		this.m_translator = LocalizationSystem.GetInstance(this.GetGame());

		this.m_container.SetHeight(1080.0);
		this.m_container.SetWidth(1920.0);

		this.m_header = InGamePopupHeader.Create();
		this.m_header.SetTitle(this.m_translator.GetText("InkPlayground-Popup-Title"));
		this.m_header.SetFluffRight(this.m_translator.GetText("InkPlayground-Popup-Fluff-Right"));
		this.m_header.Reparent(this);

		this.m_footer = InGamePopupFooter.Create();
		this.m_footer.SetFluffIcon(n"fluff_triangle2");
		this.m_footer.SetFluffText(this.m_translator.GetText("InkPlayground-Popup-Fluff-Bottom"));
		this.m_footer.Reparent(this);

		this.m_content = InGamePopupContent.Create();
		this.m_content.Reparent(this);

		this.m_textures = Textures.Create();
		this.m_textures.SetSize(this.m_content.GetSize());
		this.m_textures.SetTranslator(this.m_translator);
		this.m_textures.Reparent(this.m_content);
	}

	protected cb func OnInitialize() -> Void {
		super.OnInitialize();

		this.m_textures.SetHints(this.m_footer.GetHints());
	}

	public func UseCursor() -> Bool {
		return true;
	}

	public static func Show(requester: ref<inkGameController>) -> Void {
		let popup: ref<InkTextureSamplePopup> = new InkTextureSamplePopup();

		// Pass popup options
		//popup.SetOption1(param1);

		popup.Open(requester);
	}
}