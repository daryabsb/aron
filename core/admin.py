from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.utils.translation import gettext as _

from .models import (
    Barcode, Company, Country, Currency, Customer,
    CustomerDiscount, Document, DocumentCategory, DocumentItem,
    DocumentItemTax, DocumentType, FiscalItem, FloorPlan,
    FloorPlanTable, LoyaltyCard, Migration, Payment, PaymentType, PosOrder, PosOrderItem, PosPrinterSelection, PosPrinterSelectionSettings,
    ProductComment, ProductTax, Stock, Tax, User,
    ProductGroup, Product, Warehouse, Counter
)


class UserAdmin(BaseUserAdmin):
    ordering = ['id']
    list_display = ['email', 'name']
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        (_('Personal Info'), {'fields': ('name',)}),
        (
            _('Permissions'),
            {'fields': ('is_active', 'is_staff', 'is_superuser')}
        ),
        (_('Important Dates'), {'fields': ('last_login',)}),
        (_('Image Update'), {'fields': ('image',)})
    )
    add_fieldsets = (
        ('None', {
            'classes': ('wide',),
            'fields': ('email', 'password1', 'password2')
        }),
    )


admin.site.register(User, UserAdmin)
admin.site.register(Counter)
admin.site.register(Country)
admin.site.register(Currency)
admin.site.register(Company)
admin.site.register(FiscalItem)
admin.site.register(FloorPlan)
admin.site.register(FloorPlanTable)
admin.site.register(ProductGroup)
admin.site.register(Product)
admin.site.register(Barcode)
admin.site.register(ProductComment)
admin.site.register(Warehouse)
admin.site.register(Stock)
admin.site.register(Tax)
admin.site.register(ProductTax)
admin.site.register(Customer)
admin.site.register(CustomerDiscount)
admin.site.register(LoyaltyCard)
admin.site.register(DocumentCategory)
admin.site.register(DocumentType)
admin.site.register(Document)
admin.site.register(DocumentItem)
admin.site.register(DocumentItemTax)
admin.site.register(Migration)
admin.site.register(PaymentType)
admin.site.register(PosOrder)
admin.site.register(PosOrderItem)
admin.site.register(PosPrinterSelection)
admin.site.register(PosPrinterSelectionSettings)
