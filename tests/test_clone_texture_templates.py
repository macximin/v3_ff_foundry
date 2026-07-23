from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
TEMPLATE = ROOT / "40_works" / "_template"


class CloneTextureTemplateContractTests(unittest.TestCase):
    def read_template(self, relative_path: str) -> str:
        return (TEMPLATE / relative_path).read_text(encoding="utf-8")

    def test_source_feed_records_variable_role_bound_bundle(self) -> None:
        prompt = self.read_template("00_source_feed_prompt.md")
        self.assertIn("base_source", prompt)
        self.assertIn("supporting_sources", prompt)
        self.assertIn("source_bundle", prompt)
        self.assertIn("excluded_sources", prompt)
        self.assertIn("human_texture_function", prompt)
        self.assertIn("social_witness_or_aftershock", prompt)
        self.assertIn("material_conversion", prompt)

    def test_episode_bet_limits_render_selection_to_two_or_three_entries(self) -> None:
        episode_bet = self.read_template("03_episode_bet/ep000_episode_bet.md")
        self.assertIn("render_selection", episode_bet)
        self.assertIn("2–3", episode_bet)
        self.assertIn("must_make_visible", episode_bet)
        self.assertIn("do_not_turn_into", episode_bet)

    def test_dispatch_receives_selected_rendering_brief_once(self) -> None:
        dispatch = self.read_template("07_dispatch/ep000_dispatch.md")
        self.assertIn("render_selection", dispatch)
        self.assertIn("Episode Bet", dispatch)
        self.assertIn("action/reaction/material", dispatch)

    def test_relay_enforces_render_selection_and_compiles_it_once(self) -> None:
        relay = (ROOT / "tools" / "draft_relay" / "Invoke-DraftRelay.ps1").read_text(encoding="utf-8")
        self.assertIn("function Assert-RenderSelection", relay)
        self.assertIn("exactly 2-3 entries", relay)
        self.assertIn("function Format-RenderSelectionBlock", relay)
        self.assertIn("## Compiled render selection", relay)

    def test_relay_blind_packet_and_route_preserve_review_contract(self) -> None:
        relay = (ROOT / "tools" / "draft_relay" / "Invoke-DraftRelay.ps1").read_text(encoding="utf-8")
        self.assertIn("first remembered sensory/object/action anchor", relay)
        self.assertIn("independent response or changed behavior", relay)
        self.assertIn("abstract procedural surface", relay)
        self.assertIn("function Assert-ExternalReviewerLane", relay)
        self.assertIn("reviewer_lane", relay)

    def test_relay_separates_native_history_from_legacy_bridge(self) -> None:
        relay = (ROOT / "tools" / "draft_relay" / "Invoke-DraftRelay.ps1").read_text(encoding="utf-8")
        self.assertIn("production_stage=manuscript", relay)
        self.assertIn("authority=owner_approved", relay)
        self.assertIn("imported_legacy_bridge", relay)
        self.assertIn("Resolve-SourceFeedReceipt", relay)

    def test_blind_review_exposes_surface_drift_without_humanity_score(self) -> None:
        review = self.read_template("05_review/ep000_review.md")
        self.assertIn("first remembered sensory/object/action anchor", review)
        self.assertIn("independent response or changed behavior", review)
        self.assertIn("abstract procedural surface", review)
        self.assertNotIn("humanity score", review.lower())
    def test_hukkum_intake_manifest_catalogs_authoritative_corpus_without_preassigning_a_role(self) -> None:
        manifest = (ROOT / "30_materials" / "source_maps" / "hukkum_intake_manifest.md").read_text(encoding="utf-8")
        self.assertIn("status: intake_pending", manifest)
        self.assertIn("흑곰작가", manifest)
        self.assertIn("티끌 모아 대박_흑곰작가_합본.txt", manifest)
        self.assertIn("검은 머리 미국 대재벌!_흑곰작가_합본.txt", manifest)
        self.assertIn("bundle_role: derive_from_source_feed", manifest)


if __name__ == "__main__":
    unittest.main()
