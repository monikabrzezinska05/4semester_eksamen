import {Component, OnInit, ViewChild, ElementRef, Renderer2, AfterViewInit} from '@angular/core';

@Component({
  selector: 'app-sidebar',
  standalone: true,
  imports: [],
  templateUrl: './sidebar.component.html',
  styleUrl: './sidebar.component.css'
})
export class SidebarComponent implements OnInit, AfterViewInit {
  @ViewChild('toggleSwitch') toggleSwitch!: ElementRef;

  constructor(private renderer: Renderer2){ }

  ngOnInit(): void { }

  ngAfterViewInit(): void {
    setTimeout(() => {
      this.renderer.listen(this.toggleSwitch.nativeElement, 'click', (event) => {
        const knob = this.toggleSwitch.nativeElement.querySelector('.toggle-knob') as HTMLElement;
        if (knob.style.left === '55px') {
          // KALD HER METODE DER SKAL DEAKTIVERE NOGET!!!!
          knob.style.left = '5px';
        } else {
          // KALD HER METODE DER SKAL AKTIVERE NOGET!!!!
          knob.style.left = '55px';
        }
      });
    }, 0);
  }
}
